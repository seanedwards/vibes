# Justfile for vibes - Claude Code GitHub Actions test bench
# Run with `just <command>` or `just --list` to see available commands

# Default recipe - shows help
default:
    @just --list

# Setup development environment
setup:
    @echo "Setting up development environment..."
    @echo "Installing dependencies for all experiments..."
    @if [ -d "2025-08-21 Hello World CLI" ]; then cd "2025-08-21 Hello World CLI" && cargo check; fi
    @echo "Setup complete!"

# Run tests for all experiments
test:
    @echo "Running tests for all experiments..."
    @if [ -d "2025-08-21 Hello World CLI" ]; then cd "2025-08-21 Hello World CLI" && cargo test; fi
    @echo "All tests completed!"

# Build all experiments
build:
    @echo "Building all experiments..."
    @if [ -d "2025-08-21 Hello World CLI" ]; then cd "2025-08-21 Hello World CLI" && cargo build; fi
    @echo "Build completed!"

# Clean all build artifacts
clean:
    @echo "Cleaning build artifacts..."
    @if [ -d "2025-08-21 Hello World CLI" ]; then cd "2025-08-21 Hello World CLI" && cargo clean; fi
    @echo "Clean completed!"

# Run a specific experiment by name
run-experiment experiment:
    @echo "Running experiment: {{experiment}}"
    @if [ -d "{{experiment}}" ]; then \
        if [ -f "{{experiment}}/Cargo.toml" ]; then \
            cd "{{experiment}}" && cargo run; \
        elif [ -f "{{experiment}}/hello.rb" ]; then \
            cd "{{experiment}}" && ruby hello.rb; \
        else \
            echo "No known executable found in {{experiment}}"; \
        fi; \
    else \
        echo "Experiment directory '{{experiment}}' not found"; \
    fi

# List all experiments in the repository
list-experiments:
    @echo "Available experiments:"
    @find . -maxdepth 1 -type d -name "20*" | sort

# Create a new experiment directory with today's date
create-experiment name:
    @mkdir -p "$(date +%Y-%m-%d) {{name}}"
    @echo "Created experiment directory: $(date +%Y-%m-%d) {{name}}"

# Validate repository structure follows CLAUDE.md guidelines
validate:
    @echo "Validating repository structure..."
    @if [ ! -f "CLAUDE.md" ]; then echo "❌ CLAUDE.md not found"; exit 1; fi
    @echo "✅ CLAUDE.md exists"
    @experiment_count=$(find . -maxdepth 1 -type d -name "20*" | wc -l); \
    if [ $$experiment_count -eq 0 ]; then echo "⚠️  No experiment directories found"; else echo "✅ Found $$experiment_count experiment directories"; fi
    @echo "Repository structure validation complete!"

# Show repository information
info:
    @echo "🔬 Vibes - Claude Code GitHub Actions Test Bench"
    @echo "================================================"
    @echo "Purpose: Testing and validation of AI-powered automation features"
    @echo ""
    @echo "📁 Repository structure:"
    @tree -L 2 . 2>/dev/null || find . -type d -not -path '*/.*' | head -20
    @echo ""
    @echo "📋 Available commands:"
    @just --list