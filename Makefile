.PHONY: help install dev build test clean

help: ## Show help
	@echo 'Usage: make [target]'
	@echo 'Targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  %-15s %s\n", $$1, $$2}'

install: ## Install dependencies
	npm install
	cd frontend && npm install
	cd backend && npm install

dev: ## Start development
	docker-compose up -d postgres redis
	npm run dev

build: ## Build all
	npm run build

test: ## Run tests
	npm run test

clean: ## Clean builds
	rm -rf frontend/.next backend/dist