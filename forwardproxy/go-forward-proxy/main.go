package main

import (
	"log"
	"net"
)

func main() {
	listener, err := net.Listen("tcp", ":8080")
	if err != nil {
		panic(err)
	}
	defer listener.Close()

	log.Println("Server listening on :8080")

	for {
		conn, err := listener.Accept()
		if err != nil {
			log.Printf("Error accepting connection: %v", err)
			continue
		}

		log.Printf("New connection from %s", conn.RemoteAddr())

		go func(c net.Conn) {
			defer c.Close()
			defer log.Printf("Connection closed from %s", c.RemoteAddr())

			buf := make([]byte, 1024)
			for {
				n, err := c.Read(buf)
				if err != nil {
					log.Printf("Error reading from %s: %v", c.RemoteAddr(), err)
					return
				}
				log.Printf("Received %d bytes from %s", n, c.RemoteAddr())
				_, err = c.Write(buf[:n])
				if err != nil {
					log.Printf("Error writing to %s: %v", c.RemoteAddr(), err)
					return
				}
			}
		}(conn)
	}
}
