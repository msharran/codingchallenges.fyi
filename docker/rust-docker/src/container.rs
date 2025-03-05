use super::io::*;
use nix::sched::CloneFlags;
use nix::{self};
use std::process::{self};

pub fn move_process_to_namespace(args: &Vec<String>) -> Result<(), String> {
    // child process created
    let pid = process::id();
    write_stdout(format!("I'm a new child process with pid {pid}\n"));

    // Move the current process into a namespace. We can do this
    // by unsharing its CLONE_* flags.
    nix::sched::unshare(CloneFlags::CLONE_NEWUTS | CloneFlags::CLONE_NEWPID)
        .map_err(|e| format!("Failed to unshare UTS namespace: {}", e))?;

    // change hostname
    nix::unistd::sethostname("container").map_err(|e| format!("Failed to set hostname: {}", e))?;
    // change root
    nix::unistd::chroot("/alpine-root").map_err(|e| format!("Failed to change root: {}", e))?;

    let command = process::Command::new(&args[1])
        .args(&args[2..])
        .stdin(process::Stdio::inherit())
        .stdout(process::Stdio::inherit())
        .stderr(process::Stdio::inherit())
        .spawn();
    match command {
        Ok(mut command) => {
            command.wait().expect("command wasn't running");
            write_stdout(format!("Child has finished its execution!\n"));
        }
        Err(e) => {
            write_stdout(format!("Failed to execute command: {}\n", e));
        }
    }

    unsafe { nix::libc::exit(0) };
}
