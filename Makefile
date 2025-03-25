PROJECT_NAME=quickrank

fmt:
	@echo formatting
	@go fmt $(shell go list ./... | grep -v /vendor/)

lint:
	golangci-lint run

snapshot:
	goreleaser build --clean --snapshot

test: tidy fmt
	go test -cover ./...

tidy:
	go mod tidy

.PHONE: fmt lint snapshot test tidy
