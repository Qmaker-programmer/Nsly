# Nombre del ejecutable base
BINARY_NAME=nsly

# Rutas de origen y destino
SRC=src/main.go
BIN_DIR=bin

.PHONY: all run build build-all clean

run:
	go run $(SRC)

build:
	go build -ldflags="-s -w" -o $(BIN_DIR)/$(BINARY_NAME) $(SRC)

# Compilación cruzada total (Guarda los binarios organizados en /bin)
build-all:
	@echo "Compilando para Linux..."
	GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o $(BIN_DIR)/$(BINARY_NAME)-linux $(SRC)
	@echo "Compilando para Windows..."
	GOOS=windows GOARCH=amd64 go build -ldflags="-s -w" -o $(BIN_DIR)/$(BINARY_NAME).exe $(SRC)
	@echo "Compilando para macOS (Intel)..."
	GOOS=darwin GOARCH=amd64 go build -ldflags="-s -w" -o $(BIN_DIR)/$(BINARY_NAME)-darwin-amd64 $(SRC)
	@echo "Compilando para macOS (Apple Silicon)..."
	GOOS=darwin GOARCH=arm64 go build -ldflags="-s -w" -o $(BIN_DIR)/$(BINARY_NAME)-darwin-arm64 $(SRC)
	@echo "¡Compilación multiplataforma completada con éxito!"

clean:
	rm -rf $(BIN_DIR)/*
