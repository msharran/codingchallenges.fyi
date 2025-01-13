# dns-resolve is a simple DNS resolver written in Go

Implementing a custom DNS resolver in Go to learn about DNS protocol and networking in Go.

Coding challenge: https://codingchallenges.fyi/challenges/challenge-dns-resolver


# Output 

```bash
sharranm@2184-X1 ~/p/p/l/p/dns-resolve> ./dns-resolve                                                                                                         main-?
2024/05/18 18:01:43 DNS message (hex): 00160100000100000000000003646e7306676f6f676c6503636f6d0000010001
2024/05/18 18:01:43 Dialing Google's public DNS server at 8.8.8.8:53
2024/05/18 18:01:43 > Sending message to Google's public DNS server
2024/05/18 18:01:43 > Sent 32 bytes
2024/05/18 18:01:43 < Reading response from Google's public DNS server
2024/05/18 18:01:44 < Read 64 bytes
2024/05/18 18:01:44 Response: 00168180000100020000000003646e7306676f6f676c6503636f6d0000010001c00c000100010000002a000408080404c00c000100010000002a000408080808
```
