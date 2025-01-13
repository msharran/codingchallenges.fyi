use std::{env, process};
use wc::Config;

fn main() {
    let cfg = Config::build(env::args());
    if let Err(e) = cfg.validate() {
        eprintln!("{}", e);
        process::exit(1);
    }
    let words = wc::count_words(&cfg); 
    for word in words.iter() {
        println!("\t{} {}", word.1, word.0);
    }
}
