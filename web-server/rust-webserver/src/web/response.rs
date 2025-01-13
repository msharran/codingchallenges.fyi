use std::{io::Write, net::TcpStream};
pub struct HttpResponse {
    version: String,
    status_code: usize,
    status: String,
    body: String,
}

impl HttpResponse {
    pub fn ok(body: String) -> HttpResponse {
        HttpResponse {
            status_code: 200,
            status: "OK".to_string(),
            version: "HTTP/1.1".to_string(),
            body,
        }
    }

    pub fn not_found(body: String) -> HttpResponse {
        HttpResponse {
            status_code: 404,
            status: "Not Found".to_string(),
            version: "HTTP/1.1".to_string(),
            body,
        }
    }

    pub fn write(self, stream: &mut TcpStream) {
        let resp_str = format!(
            "{} {} {}\r\n\r\n{}\r\n\r\n",
            self.version, self.status_code, self.status, self.body
        );
        stream.write_all(resp_str.as_bytes()).unwrap();
    }
}
