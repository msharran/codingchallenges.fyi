use container::*;
use nix::{self};
use nix::{
    sys::wait::waitpid,
    unistd::{fork, ForkResult},
};
use std::{
    env,
    process::{self, ExitCode},
};

mod io {
    // Unsafe to use `println!` (or `unwrap`) here. See Safety.
    pub fn write_stdout(msg: String) {
        nix::unistd::write(std::io::stdout(), msg.as_bytes()).ok();
    }
}

mod container;

const PKG_NAME: &str = env!("CARGO_PKG_NAME");

fn main() -> ExitCode {
    match run() {
        Ok(_) => ExitCode::SUCCESS,
        Err(e) => {
            eprintln!("{}: {}", PKG_NAME, e);
            ExitCode::from(1)
        }
    }
}

fn run() -> Result<(), String> {
    let args: Vec<String> = env::args().collect();
    println!("INFO Running command: {:?}", args);
    if args.len() < 2 {
        return Err("ERROR No command given".to_string());
    }

    let pid = process::id();
    println!("INFO Parent PID {}", pid);

    // This function implements the main logic of the program.
    // It forks the process to create a child that will run in a container.
    // The parent process waits for the child to complete.
    // Below we use fork() which is unsafe as it creates a completely new process.
    // After fork() we have two processes running the same code, but the fork() call
    // returns different values to each process so they can tell which is which.
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
            // Only pass the command and arguments that needs to run
            // inside the container
            let args = args[1..].to_vec();
            let run_result = Container::new(args).run();
            if let Err(err) = run_result {
                eprintln!("Container error: {}", err);
            }
        }
        Err(_) => println!("Fork failed"),
    };

    Ok(())
}
