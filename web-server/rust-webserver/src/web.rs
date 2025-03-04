pub mod http;
use http::{HttpRequest, HttpResponse};
use log::info;
use std::{collections::HashMap, fs, net::TcpStream};

pub struct TcpConnManager {
    stream: TcpStream,
    html_files: HashMap<String, String>, // name -> content
}

impl TcpConnManager {
    pub fn from(stream: TcpStream) -> Self {
        let mut html_files = HashMap::new();
        let index_content =
            fs::read_to_string("www/index.html").expect("Unable to read index.html");
        html_files.insert("index.html".to_string(), index_content);
        info!("index.html loaded");

        Self { stream, html_files }
    }

    pub fn handle_connection(&mut self) {
        info!("Handling connection");

        let http_request = match HttpRequest::from(&mut self.stream) {
            Ok(req) => req,
            Err(e) => {
                eprintln!("Error: {e}");
                return;
            }
        };

        let response = match http_request.uri.as_str() {
            "/" | "/index.html" => {
                let content = self.html_files.get(&"index.html".to_string());
                if let Some(content) = content {
                    HttpResponse::ok(content.to_string())
                } else {
                    HttpResponse::not_found("Page not found".to_string())
                }
            }
            _ => HttpResponse::not_found("Page not found".to_string()),
        };

        response.write_all(&mut self.stream);
        info!(
            "{} {} {}",
            http_request.method, http_request.uri, response.status_code
        );
    }
}
