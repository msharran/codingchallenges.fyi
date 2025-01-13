use std::{env::Args, fmt::Debug, fs, usize};

pub fn count_words(cfg: &Config) -> Vec<(String, usize)> {
    cfg.file_paths
        .iter()
        .map(|f| (f, fs::read_to_string(f).unwrap_or_default()))
        .map(|(f, text)| {
            let words = text
                .lines()
                .map(|line| line.split_whitespace().count())
                .sum();
            (String::from(f), words)
        })
        .collect()
}

#[derive(Debug)]
pub struct Config {
    file_paths: Vec<String>,
}

impl Config {
    pub fn build(mut args: Args) -> Config {
        let _ = args.next();
        Config {
            file_paths: args.collect(),
        }
    }

    pub fn validate(&self) -> Result<(), String> {
        if self.file_paths.len() == 0 {
            return Err(String::from("atleast one file_path must be provided"));
        }

        // check if files exist and are readable
        for f in self.file_paths.iter() {
            if !fs::metadata(f).is_ok() {
                return Err(format!("{}: No such file or directory", f));
            }
        }
        Ok(())
    }
}
