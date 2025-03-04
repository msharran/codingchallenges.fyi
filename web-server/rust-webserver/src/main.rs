mod web;
use log::{error, info};
use std::net::TcpListener;
use stderrlog::LogLevelNum;
use web::TcpConnManager;

fn main() {
    stderrlog::new()
        .module(module_path!())
        .verbosity(LogLevelNum::Info)
        .init()
        .unwrap();

    let socket = TcpListener::bind("127.0.0.1:8080").unwrap();
    info!("Socket listening on {}", 8080);

    for stream in socket.incoming() {
        match stream {
            Err(e) => {
                error!("Cannot establish connection, {e:?}");
                continue;
            }
            Ok(s) => {
                let mut mgr = TcpConnManager::from(s);
                mgr.handle_connection();
            }
        };
    }
}
