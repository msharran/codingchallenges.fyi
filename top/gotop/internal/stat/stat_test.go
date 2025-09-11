package stat_test

import (
	"gotop/internal/stat"
	"os"
	"path/filepath"
	"reflect"
	"testing"
)

func TestStat(t *testing.T) {
	tests := []struct {
		name        string
		setupFile   string
		fileContent string
		wantErr     bool
		wantStat    *stat.Stat
	}{
		{
			name:      "valid /proc/stat file",
			setupFile: "stat_valid",
			fileContent: `cpu  74608 2520 24433 1117073 6176 4054 0 0 0 0
cpu0 37304 1260 12216 558536 3088 2027 0 0 0 0
cpu1 37304 1260 12217 558537 3088 2027 0 0 0 0
intr 1234567 0 0 0 0 0 0 0 0 0 0
ctxt 1234567
btime 1609459200
processes 1234
procs_running 1
procs_blocked 0
softirq 123456 0 0 0 0 0 0 0 0 0 0`,
			wantErr: false,
			wantStat: &stat.Stat{
				CPU: stat.CPUStat{
					Name:      "cpu",
					User:      74608,
					Nice:      2520,
					System:    24433,
					Idle:      1117073,
					IOwait:    6176,
					Irq:       4054,
					SoftIrq:   0,
					Steal:     0,
					Guest:     0,
					GuestNice: 0,
				},
				CPUs: []stat.CPUStat{
					{
						Name:      "cpu0",
						User:      37304,
						Nice:      1260,
						System:    12216,
						Idle:      558536,
						IOwait:    3088,
						Irq:       2027,
						SoftIrq:   0,
						Steal:     0,
						Guest:     0,
						GuestNice: 0,
					},
					{
						Name:      "cpu1",
						User:      37304,
						Nice:      1260,
						System:    12217,
						Idle:      558537,
						IOwait:    3088,
						Irq:       2027,
						SoftIrq:   0,
						Steal:     0,
						Guest:     0,
						GuestNice: 0,
					},
				},
			},
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			tmpDir := t.TempDir()

			var testFile string
			if tt.name != "nonexistent file" {
				// Create test file
				testFile = filepath.Join(tmpDir, tt.setupFile)
				err := os.WriteFile(testFile, []byte(tt.fileContent), 0644)
				if err != nil {
					t.Fatalf("failed to create test file: %v", err)
				}
			} else {
				testFile = filepath.Join(tmpDir, "does_not_exist")
			}

			originalFile := stat.FileProcStat
			stat.FileProcStat = testFile
			defer func() {
				stat.FileProcStat = originalFile
			}()

			result, err := stat.Current()

			if (err != nil) != tt.wantErr {
				t.Errorf("Stat() error = %v, wantErr %v", err, tt.wantErr)
				return
			}

			// Skip further checks if we expected an error
			if tt.wantErr {
				return
			}

			if result == nil {
				t.Fatal("Stat() returned nil result")
			}

			if !reflect.DeepEqual(result, tt.wantStat) {
				t.Errorf("Stat() result mismatch:\nGot: %+v\nWant: %+v", result, tt.wantStat)
			}
		})
	}
}
