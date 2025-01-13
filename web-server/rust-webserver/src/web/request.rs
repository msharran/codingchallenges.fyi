use std::{
    io::{BufRead, BufReader},
    net::TcpStream,
};

#[derive(Debug)]
pub struct HttpRequest {
    // headers: HashMap<String, String>,
    version: String,
    uri: String,
    method: String,
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
