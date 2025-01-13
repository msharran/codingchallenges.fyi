use std::{
    io::{BufRead, BufReader, Write},
    net::TcpStream,
};

pub struct HttpResponse {
    version: String,
    pub status_code: usize,
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

    pub fn write_all(&self, stream: &mut TcpStream) {
        let resp_str = format!(
            "{} {} {}\r\n\r\n{}\r\n\r\n",
            self.version, self.status_code, self.status, self.body
        );
        stream.write_all(resp_str.as_bytes()).unwrap();
    }
}


#[derive(Debug)]
pub struct HttpRequest {
    // headers: HashMap<String, String>,
    pub version: String,
    pub uri: String,
    pub method: String,
}

impl HttpRequest {
    pub fn from(stream: &mut TcpStream) -> Result<HttpRequest, String> {
        let r = BufReader::new(stream);
        let mut errs = vec![];
        let lines: Vec<_> = r
            .lines()
            .filter_map(|r| r.map_err(|e| errs.push(e.to_string())).ok())
            .take_while(|l| !l.is_empty())
            .collect();

        if errs.len() > 0 {
            return Err(errs.join(", "));
        }

        // lines won't be empty at any cost
        // as we are filterning only non empty lines
        let first = lines.iter().next().unwrap();

        let first_parts: Vec<_> = first.split_whitespace().collect();
        if first_parts.len() != 3 {
            return Err(format!(
                "request first line must be 3 parts. got: {}",
                first
            ));
        }

        let method = first_parts.get(0).unwrap().to_string();
        let uri = first_parts.get(1).unwrap().to_string();
        let version = first_parts.get(2).unwrap().to_string();

        let req = HttpRequest {
            uri,
            method,
            version,
        };
        Ok(req)
    }
}
