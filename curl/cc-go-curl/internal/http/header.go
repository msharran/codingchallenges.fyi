package http

type Headers map[string]string

func (h Headers) Set(k, v string) {
	h[k] = v
}

func (h Headers) Get(k string) string {
	return h[k]
}
