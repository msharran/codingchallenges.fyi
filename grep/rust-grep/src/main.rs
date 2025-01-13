use anyhow::{Context, Result};
use clap::Parser;
use std::{
    io::{self, Read},
    path::PathBuf,
    process,
};

/// Simple program to greet a person
#[derive(Parser, Debug)]
#[command(author, version, about, long_about = None)]
struct Args {
    /// pattern to search
    pattern: String,

    /// file_path if incase content is not piped in via stdin
    /// when this argument is provided, piping to stdin will be ignored
    #[arg(short = 'f', long)]
    file_path: String,

    /// Show line number of the matching line
    #[arg(short = 'l', long)]
    show_line_number: bool,

    /// case insensitive search
    #[arg(short = 'i', long)]
    case_insensitive: bool,

    /// line count
    #[arg(short = 'c', long)]
    line_count: bool,
}

fn main() -> Result<(), anyhow::Error> {
    let args = Args::parse();

    let path_buf = PathBuf::from(&args.file_path);
    let mut user_input = String::new();

    if args.file_path == "-" {
        let mut stdin = io::stdin();
        stdin
            .read_to_string(&mut user_input)
            .with_context(|| "unable to read from stdin")?;

        if user_input.is_empty() {
            eprintln!("Error: stdin content is empty");
            process::exit(1);
        }
    } else {
        user_input = std::fs::read_to_string(&path_buf)
            .with_context(|| format!("unable to read file from {:?}", args.file_path))?;
    }

    let mut ptn = args.pattern.to_string();
    if args.case_insensitive {
        ptn = args.pattern.to_lowercase();
    }

    let mut count = 0;
    for (i, line) in user_input.lines().enumerate() {
        let mut ln = line.to_string();
        if args.case_insensitive {
            ln = line.to_lowercase();
        }

        if ln.contains(&ptn) {
            if args.line_count {
                count += 1;
                continue;
            }
            if args.show_line_number {
                println!("{} {}", i, line)
            } else {
                println!("{}", line)
            }
        }
    }

    if args.line_count {
        println!("{}", count)
    }
    Ok(())
}
