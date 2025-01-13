package main

// token bucket and max tokens
// consume token from the bucket for the user for every request
// when bkt is empty, thow rate limit error
// periodically add token to the bucket
type RateLimitter struct {
	max    int
	tokens map[string]chan struct{}
}

func NewRateLimitter(capacity int) *RateLimitter {
	return &RateLimitter{
		max:    capacity,
		tokens: make(map[string]chan struct{}),
	}
}

func (rl *RateLimitter) backfill() {
	for _, bkt := range rl.tokens {
		select {
		case bkt <- struct{}{}:
		default:
		}
	}
}

func (rl *RateLimitter) registerNewUser(ip string) {
	if _, ok := rl.tokens[ip]; !ok {
		rl.tokens[ip] = make(chan struct{}, rl.max)
		for i := 0; i < rl.max; i++ {
			rl.tokens[ip] <- struct{}{}
		}
	}
}

func (rl *RateLimitter) consume(ip string) bool {
	bkt, ok := rl.tokens[ip]
	if !ok {
		return false
	}

	select {
	case <-bkt:
		return true
	default:
		return false
	}
}
