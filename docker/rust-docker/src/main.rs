use nix::sched::CloneFlags;
use nix::{self};
use nix::{
    sys::wait::waitpid,
    unistd::{fork, write, ForkResult},
};
use std::{
    env,
    process::{self, ExitCode},
};

const PKG_NAME: &str = env!("CARGO_PKG_NAME");

fn main() -> ExitCode {
    match run() {
        Ok(_) => ExitCode::SUCCESS,
        Err(e) => {
            eprintln!("{}: {}", PKG_NAME, e);
            ExitCode::FAILURE
        }
    }
}

fn run() -> Result<(), String> {
    let args: Vec<String> = env::args().collect();
    println!("Running command: {:?}", args);
    if args.is_empty() {
        return Err("No command given".to_string());
    }

    // clone a new process with /proc/self/exe into UTS namespace
    // then change hostname inside the namespace
    // then run the given command

    let pid = process::id();
    println!("My PID {}", pid);

    match unsafe { fork() } {
        Ok(ForkResult::Parent { child, .. }) => {
            println!(
                "Continuing execution in parent process, new child has pid: {}",
                child
            );
            waitpid(child, None).unwrap();
            println!("Parent execution done")
        }
        Ok(ForkResult::Child) => {
            // child process created
            let pid = process::id();
            write_stdout(format!("I'm a new child process with pid {pid}\n"));

            // Move the current process into a namespace. We can do this
            // by unsharing its CLONE_* flags.
            nix::sched::unshare(CloneFlags::CLONE_NEWUTS | CloneFlags::CLONE_NEWPID)
                .map_err(|e| format!("Failed to unshare UTS namespace: {}", e))?;

            // change hostname
            nix::unistd::sethostname("inside-container")
                .map_err(|e| format!("Failed to set hostname: {}", e))?;
            // change root
            nix::unistd::chroot("/alpine-root")
                .map_err(|e| format!("Failed to change root: {}", e))?;

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
        Err(_) => println!("Fork failed"),
    };

    Ok(())
}

// Unsafe to use `println!` (or `unwrap`) here. See Safety.
fn write_stdout(msg: String) {
    write(std::io::stdout(), msg.as_bytes()).ok();
}
