use super::io::*;
use nix::sched::CloneFlags;
use nix::{self};
use std::process::{self};

pub struct Container {
    pid: String,
    command: Vec<String>,
}

impl Container {
    pub fn new(command: Vec<String>) -> Self {
        Container {
            pid: process::id().to_string(),
            command,
        }
    }

    pub fn run(&mut self) -> Result<(), String> {
        write_stdout(format!(
            "INFO I'm a new child process with pid {}\n",
            self.pid
        ));

        // Move the current process into a namespace. We can do this
        // by unsharing its CLONE_* flags.
        nix::sched::unshare(CloneFlags::CLONE_NEWUTS | CloneFlags::CLONE_NEWPID)
            .map_err(|e| format!("ERROR Failed to unshare UTS namespace: {}", e))?;

        // change hostname
        nix::unistd::sethostname("container")
            .map_err(|e| format!("ERROR Failed to set hostname: {}", e))?;
        // change root
        nix::unistd::chroot("/alpine-root").map_err(|e| format!("Failed to change root: {}", e))?;

        let command = process::Command::new(&self.command[0])
            .args(&self.command[1..])
            .stdin(process::Stdio::inherit())
            .stdout(process::Stdio::inherit())
            .stderr(process::Stdio::inherit())
            .spawn();
        match command {
            Ok(mut command) => {
                command.wait().expect("command wasn't running");

                write_stdout(format!("INFO Child command has finished its execution!\n"));
            }
            Err(e) => {
                write_stdout(format!("ERROR Failed to execute Child command: {}\n", e));
            }
        }

        Ok(())
    }
}

impl Drop for Container {
    fn drop(&mut self) {
        write_stdout(format!(
            "INFO Container with pid {} has been dropped!\n",
            self.pid
        ));
        unsafe { nix::libc::exit(0) };
    }
}
