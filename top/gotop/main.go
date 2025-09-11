package main

import (
	"fmt"
	"gotop/internal/stat"
	"log"
	"os"
	"strings"
	"time"

	"github.com/gdamore/tcell/v2"
	"github.com/rivo/tview"
)

const refreshInterval = 2 * time.Second

var (
	app           *tview.Application
	grid          *tview.Grid
	headerView    *tview.TextView
	processTable  *tview.Table
	logFile       = "gotop.log"
	logFileHandle *os.File
)

func generateHeader() string {
	c, err := stat.Current()
	if err != nil {
		return fmt.Sprintf("error: %s", err.Error())
	}

	now := time.Now()
	uptime := "up 2 days, 12:05"
	users := 1
	loadAvg := "0.51, 0.42, 0.42"

	header1 := fmt.Sprintf("top - %s  %s,  %d user,  load average: %s",
		now.Format("15:04:05"), uptime, users, loadAvg)

	header2 := "Tasks:  27 total,   1 running,  26 sleeping,   0 stopped,   0 zombie"

	cpu := c.CPU
	header3 := fmt.Sprintf("%%Cpu(s): %4.1f us, %4.1f sy, %4.1f ni, %4.1f id, %4.1f wa, %4.1f hi, %4.1f si, %4.1f st",
		cpu.UserPercent(), cpu.SystemPercent(), cpu.NicePercent(), cpu.IdlePercent(),
		cpu.IOwaitPercent(), cpu.IrqPercent(), cpu.SoftIrqPercent(), cpu.StealPercent())

	header4 := "MiB Mem :  7996.0 total,  5957.3 free,  1421.2 used,   912.8 buff/cache"
	header5 := "MiB Swap:  9020.0 total,  9020.0 free,     0.0 used.  6574.8 avail Mem"

	return strings.Join([]string{header1, header2, header3, header4, header5}, "\n")
}

func setupProcessTable() {
	processTable.SetBorders(false).SetSelectable(true, false)

	// Set headers
	headers := []string{"PID", "USER", "PR", "NI", "VIRT", "RES", "SHR", "S", "%CPU", "%MEM", "TIME+", "COMMAND"}
	for col, header := range headers {
		processTable.SetCell(0, col, tview.NewTableCell(header).
			SetAlign(tview.AlignLeft).
			SetSelectable(false))
	}

	// Add sample process data
	processes := [][]string{
		{"1", "root", "20", "0", "24276", "4952", "804", "S", "0.0", "0.1", "0:17.73", "systemd"},
		{"8", "root", "20", "0", "1247596", "12504", "1340", "S", "0.0", "0.2", "0:49.08", "orbstack-agent:"},
		{"173", "root", "20", "0", "31796", "2724", "520", "S", "0.0", "0.0", "0:07.53", "systemd-udevd"},
		{"257", "root", "20", "0", "9568", "484", "240", "S", "0.0", "0.0", "0:07.46", "cron"},
		{"258", "message+", "20", "0", "8784", "1220", "260", "S", "0.0", "0.0", "0:01.61", "dbus-daemon"},
		{"270", "root", "20", "0", "9996", "248", "16", "S", "0.0", "0.0", "0:00.05", "agetty"},
	}

	for row, process := range processes {
		for col, value := range process {
			processTable.SetCell(row+1, col, tview.NewTableCell(value).
				SetAlign(tview.AlignLeft))
		}
	}
}

func refreshPeriodically() {
	ticker := time.NewTicker(refreshInterval)
	defer ticker.Stop()

	for {
		select {
		case <-ticker.C:
			app.QueueUpdateDraw(func() {
				headerView.SetText(generateHeader())
			})
		}
	}
}

func main() {
	var err error
	logFileHandle, err = os.OpenFile(logFile, os.O_CREATE|os.O_WRONLY|os.O_APPEND, 0666)
	if err != nil {
		panic(err)
	}
	defer logFileHandle.Close()

	log.SetOutput(logFileHandle)
	log.SetPrefix("gotop: ")
	log.Println("starting gotop")

	app = tview.NewApplication()

	// Create header
	headerView = tview.NewTextView().
		SetText(generateHeader()).
		SetDynamicColors(true)

	// Create process table
	processTable = tview.NewTable()
	setupProcessTable()

	// Create grid layout
	grid = tview.NewGrid().
		SetRows(6, 0). // Header: 6 rows, Main content: remaining space
		SetColumns(0). // Single column
		SetBorders(false)

	// Add components to grid
	grid.AddItem(headerView, 0, 0, 1, 1, 0, 0, false).
		AddItem(processTable, 1, 0, 1, 1, 0, 100, true)

	// Handle key events
	app.SetInputCapture(func(event *tcell.EventKey) *tcell.EventKey {
		if event.Key() == tcell.KeyCtrlC || event.Rune() == 'q' {
			app.Stop()
		}
		return event
	})

	go refreshPeriodically()

	if err := app.SetRoot(grid, true).Run(); err != nil {
		panic(err)
	}
}
