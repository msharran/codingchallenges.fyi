use std::collections::HashMap;
use std::sync::Arc;
use std::sync::Mutex;
use std::thread;
use std::time;

use rouille::router;
use rouille::Request;
use rouille::Response;

struct RateLimiter {
    max_tokens: i32,
    tokens_bucket: HashMap<String, Vec<bool>>,
}

impl RateLimiter {
    fn new(rate_limit: i32) -> RateLimiter {
        RateLimiter {
            max_tokens: rate_limit,
            tokens_bucket: HashMap::new(),
        }
    }
}

fn handle_unlimited(_request: &Request) -> Response {
    Response::text("Unlimited! Let's Go!")
}

fn start_server(limiter: Arc<Mutex<RateLimiter>>) {
    let limiter_svr_copy = limiter.clone();
    rouille::start_server("localhost:8080", move |request| {
        router!(request,
        (GET) (/limited) => {
            let mut limiter = limiter_svr_copy.lock().unwrap();
            let ip = request.remote_addr().ip().to_string();

            let tokens_bucket = match limiter.tokens_bucket.get_mut(&ip) {
                Some(tokens) => tokens,
                None => {
                    let tokens = vec![true; limiter.max_tokens as usize];
                    limiter.tokens_bucket.insert(ip.clone(), tokens);
                    limiter.tokens_bucket.get_mut(&ip).unwrap()
                }
            };

            if tokens_bucket.is_empty() {
                return Response::text(format!("Your IP is limited! {:?}", request.remote_addr()))
                    .with_status_code(429);
            }

            // Consume a token
            tokens_bucket.pop();
            Response::text(format!("Your IP is {:?}", request.remote_addr()))
        },
        (GET) (/unlimited) => {handle_unlimited(request)},
        _ => Response::empty_404()
            )
    });
}

fn main() {
    println!("Starting server on localhost:8080");
    let limiter = Arc::new(Mutex::new(RateLimiter::new(10)));

    // span a thread to keep adding tokens to the bucket every
    // 1 second
    let limiter_backfill = limiter.clone();
    let backfill_thread = std::thread::spawn(move || loop {
        println!("Backfilling thread loop");
        thread::sleep(time::Duration::from_secs(3));

        let mut l = limiter_backfill.lock().unwrap();
        let max_tokens = l.max_tokens as usize;
        // check each ip's tokens, add if less than max_tokens
        for (ip, tokens) in l.tokens_bucket.iter_mut() {
            if tokens.len() < max_tokens {
                tokens.push(true);
                println!("Backfilled tokens for ip: {}: {:?}", ip, tokens);
            }
        }
    });

    let svr_thread = std::thread::spawn(move || {
        println!("Starting server thread");
        start_server(limiter);
        println!("Server thread exited");
    });

    svr_thread.join().unwrap();
    backfill_thread.join().unwrap();
    println!("Server exited");
}

#[cfg(test)]
mod tests {
    // Note this useful idiom: importing names from outer (for mod tests) scope.
    use super::*;
    use rouille::Request;

    #[test]
    fn test_handle_limited() {
        let got = handle_limited(&Request::fake_http("GET", "/limited", vec![], vec![]));
        assert_eq!(got.status_code, 200);
    }
}
