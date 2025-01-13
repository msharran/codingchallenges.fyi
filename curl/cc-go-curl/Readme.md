
```bash
projects/cc-go-curl [main●] » ./curl http://eu.httpbin.org/get -v
* Connecting to eu.httpbin.org (************) port 80
> GET /get HTTP/1.1
> Connection: close
> Host: eu.httpbin.org
> Accept: */*
>
< HTTP/1.1 200 OK
< Connection:  close
< Server:  gunicorn/19.9.0
< Access-Control-Allow-Origin:  *
< Access-Control-Allow-Credentials:  true
< Date:  Tue, 04 Jun 2024 12:52:37 GMT
< Content-Type:  application/json
< Content-Length:  225
<

{  "args": {},   "headers": {    "Accept": "*/*",     "Host": "eu.httpbin.org",     "X-Amzn-Trace-Id": "Root=1-665f0e15-54ac009005cb48ec1df2711f"  },   "origin": "************",   "url": "http://eu.httpbin.org/get"}
```
