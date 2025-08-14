use anyhow::{Context, Result};
use std::env;
use std::fs;

fn main() -> Result<()> {
    let args: Vec<String> = env::args().collect();

    if args.len() < 3 {
        anyhow::bail!("Usage: {} <filename> [-f]", args[0]);
    }

    let filename = &args[1];
    let field_arg = &args[2];
    
    // Parse field number from -f<number> format
    let field_num: usize = if field_arg.starts_with("-f") {
        let num_str = &field_arg[2..];
        let parsed_num: usize = num_str.parse().context("Invalid field number")?;
        if parsed_num == 0 {
            anyhow::bail!("cut: [-bcf] list: values may not include zero");
        }
        parsed_num
    } else {
        anyhow::bail!("Expected -f<number> format, got: {}", field_arg);
    };

    // Read file with proper error handling
    let contents = read_file(filename)?;

    let fields: Vec<&str> = contents
        .lines()
        .map(|line| {
            line.split_whitespace()
                .nth(field_num-1)
                .unwrap_or("")
        })
        .collect();

    for field in fields {
        println!("{}", field);
    }

    Ok(())
}

fn read_file(filename: &str) -> Result<String> {
    fs::read_to_string(filename).with_context(|| format!("Failed to read file '{}'", filename))
}
