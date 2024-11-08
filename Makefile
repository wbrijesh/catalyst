package-install:
	@echo "Installing required packages for server..."
	@cd server && go mod download
	@echo "Installing required packages for client..."
	@cd client && pnpm install

server-build:
	@echo "Building server..."
	@cd server && build -o main server/cmd/api/main.go

server-run:
	@cd server && go run cmd/api/main.go

server-clean:
	@echo "Cleaning server binary..."
	@cd server && rm -f main

server-watch:
	@if command -v air > /dev/null; then \
		cd server && air; \
		echo "Running server with hot reload...";\
    else \
		echo "Go's 'air' is not installed on your machine. Installing..."; \
		go install github.com/air-verse/air@latest; \
		cd server && air; \
		echo "Running server with hot reload...";\
    fi

client-build:
	@echo "Building client..."
	@cd client && pnpm run build

client-clean:
	@echo "Cleaning client build..."
	@cd client && rm -rf dist

client-watch:
	@echo "Running client with hot reload..."
	@cd client && pnpm run dev

.PHONY: package-install server-build server-run server-clean server-watch client-build client-clean client-watch
