package stat

import (
	"bufio"
	"fmt"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

var (
	FileProcStat = filepath.Join("/proc", "stat")
)

type CPUStat struct {
	Name      string
	User      uint64
	Nice      uint64
	System    uint64
	Idle      uint64
	IOwait    uint64
	Irq       uint64
	SoftIrq   uint64
	Steal     uint64
	Guest     uint64
	GuestNice uint64
}

func (c CPUStat) Total() uint64 {
	return c.User + c.Nice + c.System + c.Idle + c.IOwait + c.Irq + c.SoftIrq + c.Steal + c.Guest + c.GuestNice
}

func (c CPUStat) UserPercent() float64 {
	total := c.Total()
	if total == 0 {
		return 0.0
	}
	return (float64(c.User) / float64(total)) * 100.0
}

func (c CPUStat) SystemPercent() float64 {
	total := c.Total()
	if total == 0 {
		return 0.0
	}
	return (float64(c.System) / float64(total)) * 100.0
}

func (c CPUStat) NicePercent() float64 {
	total := c.Total()
	if total == 0 {
		return 0.0
	}
	return (float64(c.Nice) / float64(total)) * 100.0
}

func (c CPUStat) IdlePercent() float64 {
	total := c.Total()
	if total == 0 {
		return 0.0
	}
	return (float64(c.Idle) / float64(total)) * 100.0
}

func (c CPUStat) IOwaitPercent() float64 {
	total := c.Total()
	if total == 0 {
		return 0.0
	}
	return (float64(c.IOwait) / float64(total)) * 100.0
}

func (c CPUStat) IrqPercent() float64 {
	total := c.Total()
	if total == 0 {
		return 0.0
	}
	return (float64(c.Irq) / float64(total)) * 100.0
}

func (c CPUStat) SoftIrqPercent() float64 {
	total := c.Total()
	if total == 0 {
		return 0.0
	}
	return (float64(c.SoftIrq) / float64(total)) * 100.0
}

func (c CPUStat) StealPercent() float64 {
	total := c.Total()
	if total == 0 {
		return 0.0
	}
	return (float64(c.Steal) / float64(total)) * 100.0
}

type Stat struct {
	CPU  CPUStat
	CPUs []CPUStat
}

func Current() (*Stat, error) {
	f, err := os.Open(FileProcStat)
	if err != nil {
		return nil, fmt.Errorf("failed to read %s: %w", FileProcStat, err)
	}
	defer f.Close()

	scanner := bufio.NewScanner(f)
	statInfo := &Stat{}

	var cpuVisited bool
	for scanner.Scan() {
		line := scanner.Text()
		switch {
		case strings.HasPrefix(line, "cpu"):
			cpu, err := readCPUStat(line)
			if err != nil {
				return nil, fmt.Errorf("failed to parse cpu line %q: %w", line, err)
			}
			if !cpuVisited {
				statInfo.CPU = *cpu
				cpuVisited = true
			} else {
				statInfo.CPUs = append(statInfo.CPUs, *cpu)
			}
		}
	}

	if err := scanner.Err(); err != nil {
		return nil, fmt.Errorf("error reading %s: %w", FileProcStat, err)
	}

	return statInfo, nil
}

func readCPUStat(line string) (*CPUStat, error) {
	fields := strings.Fields(line)
	if len(fields) < 11 {
		return nil, fmt.Errorf("expected at least 11 fields in cpu stat line, got %d", len(fields))
	}

	// Parse each numeric field (fields[0] is "cpu", so start from fields[1])
	parseField := func(fieldIndex int, fieldName string) (uint64, error) {
		val, err := strconv.ParseUint(fields[fieldIndex], 10, 64)
		if err != nil {
			return 0, fmt.Errorf("failed to parse %s field: %w", fieldName, err)
		}
		return val, nil
	}

	user, err := parseField(1, "user")
	if err != nil {
		return nil, err
	}

	nice, err := parseField(2, "nice")
	if err != nil {
		return nil, err
	}

	system, err := parseField(3, "system")
	if err != nil {
		return nil, err
	}

	idle, err := parseField(4, "idle")
	if err != nil {
		return nil, err
	}

	iowait, err := parseField(5, "iowait")
	if err != nil {
		return nil, err
	}

	irq, err := parseField(6, "irq")
	if err != nil {
		return nil, err
	}

	softirq, err := parseField(7, "softirq")
	if err != nil {
		return nil, err
	}

	steal, err := parseField(8, "steal")
	if err != nil {
		return nil, err
	}

	guest, err := parseField(9, "guest")
	if err != nil {
		return nil, err
	}

	guestNice, err := parseField(10, "guest_nice")
	if err != nil {
		return nil, err
	}

	return &CPUStat{
		Name:      fields[0],
		User:      user,
		Nice:      nice,
		System:    system,
		Idle:      idle,
		IOwait:    iowait,
		Irq:       irq,
		SoftIrq:   softirq,
		Steal:     steal,
		Guest:     guest,
		GuestNice: guestNice,
	}, nil
}
