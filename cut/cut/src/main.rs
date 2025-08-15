use anyhow::{bail, Context, Result};
use std::env;
use std::fs;
use std::usize;

/// Mode for cut operation - mutually exclusive flags
#[derive(Debug, Clone)]
pub enum Mode {
    /// Extract fields (-f flag) - 1-based indexing, separated by delimiter
    Field(usize),
    /// Extract characters (-c flag) - 1-based indexing, character positions  
    Character(usize),
    /// Extract bytes (-b flag) - 1-based indexing, byte positions
    Byte(usize),
}

/// Command line arguments for the cut utility
#[derive(Debug)]
pub struct CLI {
    /// Mode to perform cut operation (mutually exclusive: -f, -c, or -b)
    pub mode: Option<Mode>,

    /// Input file names to process
    /// If empty, reads from stdin
    pub file_names: Vec<String>,

    /// Binary name of the process
    pub bin: String,
}

impl CLI {
    pub fn parse(mut args: impl Iterator<Item = String>) -> Result<CLI> {
        let mut mode = None;
        let mut file_names = Vec::new();

        let bin = args.next().unwrap_or("cut".to_string());

        while let Some(arg) = args.next() {
            match arg {
                arg if arg.starts_with("-f") => {
                    if mode.is_some() {
                        bail!("cut: only one of -f, -c, or -b may be specified");
                    }
                    let num = Self::parse_flag_value(&arg, &mut args, "-f")?;
                    mode = Some(Mode::Field(num));
                }
                arg if arg.starts_with("-c") => {
                    if mode.is_some() {
                        bail!("cut: only one of -f, -c, or -b may be specified");
                    }
                    let num = Self::parse_flag_value(&arg, &mut args, "-c")?;
                    mode = Some(Mode::Character(num));
                }
                arg if arg.starts_with("-b") => {
                    if mode.is_some() {
                        bail!("cut: only one of -f, -c, or -b may be specified");
                    }
                    let num = Self::parse_flag_value(&arg, &mut args, "-b")?;
                    mode = Some(Mode::Byte(num));
                }
                arg if arg.starts_with("-") => {
                    bail!("Unknown flag: {}", arg);
                }
                _ => {
                    file_names.push(arg);
                }
            }
        }

        Ok(CLI { mode, file_names, bin })
    }

    fn parse_flag_value(
        arg: &str, 
        args: &mut impl Iterator<Item = String>, 
        flag: &str
    ) -> Result<usize> {
        if arg.len() > 2 {
            // -f<number> format
            let num_str = &arg[2..];
            let parsed_num: usize = num_str.parse()
                .with_context(|| format!("Invalid {} number", flag))?;
            if parsed_num == 0 {
                bail!("cut: [-bcf] list: values may not include zero");
            }
            Ok(parsed_num)
        } else {
            // -f <number> format
            if let Some(next_arg) = args.next() {
                let parsed_num: usize = next_arg.parse()
                    .with_context(|| format!("Invalid {} number", flag))?;
                if parsed_num == 0 {
                    bail!("cut: [-bcf] list: values may not include zero");
                }
                Ok(parsed_num)
            } else {
                bail!("Option {} requires an argument", flag);
            }
        }
    }
}

fn main() -> Result<()> {
    let cli = CLI::parse(env::args().into_iter())?;

    let mode = cli.mode.ok_or_else(|| {
        anyhow::anyhow!("cut: you must specify a list of bytes, characters, or fields")
    })?;

    for filename in &cli.file_names {
        let contents = read_file(&filename)?;
        
        match &mode {
            Mode::Field(field_num) => {
                let fields: Vec<&str> = contents
                    .lines()
                    .map(|line| line.split_whitespace().nth(field_num - 1).unwrap_or(""))
                    .collect();
                
                for field in fields {
                    println!("{}", field);
                }
            }
            Mode::Character(char_num) => {
                for line in contents.lines() {
                    let chars: Vec<char> = line.chars().collect();
                    if let Some(ch) = chars.get(char_num - 1) {
                        println!("{}", ch);
                    } else {
                        println!();
                    }
                }
            }
            Mode::Byte(byte_num) => {
                for line in contents.lines() {
                    let bytes = line.as_bytes();
                    if let Some(byte) = bytes.get(byte_num - 1) {
                        print!("{}", *byte as char);
                    }
                    println!();
                }
            }
        }
    }

    Ok(())
}

fn read_file(filename: &str) -> Result<String> {
    fs::read_to_string(filename).with_context(|| format!("Failed to read file '{}'", filename))
}
