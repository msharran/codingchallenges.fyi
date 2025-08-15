use crate::args::{Args, Mode};
use anyhow::{anyhow, bail, Context, Result};
use std::env;
use std::fs;

pub struct Runtime {
    args: Args,
}

impl Runtime {
    pub fn new() -> Result<Runtime> {
        let args = Args::from(env::args().into_iter()).context("Failed to parse args")?;
        Ok(Runtime { args })
    }

    /// exec function executes the cut command
    pub fn exec(&self) -> Result<()> {
        if self.args.file_names.len() == 0 {
            bail!("filenames are missing");
        }

        let mode = self
            .args
            .mode
            .clone()
            .ok_or(anyhow!("One of -fcb should be passed"))?;

        match mode {
            Mode::Field(field_num) => {
                for filename in &self.args.file_names {
                    let contents = Self::read_file(&filename)?;
                    let fields: Vec<&str> = contents
                        .lines()
                        .map(|line| line.split('\t').nth(field_num - 1).unwrap_or(""))
                        .collect();

                    for field in fields {
                        println!("{}", field);
                    }
                }
            }
            Mode::Character(_char_num) => {
                panic!("not implemented")
            }
            Mode::Byte(_byte_num) => {
                panic!("not implemented")
            }
        }

        Ok(())
    }

    fn read_file(filename: &str) -> Result<String> {
        fs::read_to_string(filename).with_context(|| format!("Failed to read file '{}'", filename))
    }
}
