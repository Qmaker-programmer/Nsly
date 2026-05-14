build:
	go build -o bin/nsly src/main.go

run:
	go run src/main.go
	
clean:
	rm -rf bin/*
