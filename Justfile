# Justfile for vibes - Claude Code GitHub Actions test bench
# Run with `just <command>` or `just --list` to see available commands

# Default recipe - shows help
default:
    @just --list

# Run commands on a specific experiment by date prefix
# Usage: just run 2025-08-21 <command>
run date *args:
    #!/usr/bin/env bash
    set -euo pipefail
    
    # Find directory with the specified date prefix
    experiment_dir=$(find . -maxdepth 1 -type d -name "{{date}}*" | head -1)
    
    if [ -z "$experiment_dir" ]; then
        echo "❌ No experiment found with date prefix: {{date}}"
        echo "Available experiments:"
        find . -maxdepth 1 -type d -name "20*" | sort
        exit 1
    fi
    
    echo "🔬 Running in experiment: $experiment_dir"
    
    # Change to the experiment directory
    cd "$experiment_dir"
    
    # Install dependencies with asdf
    echo "📦 Installing dependencies with asdf..."
    asdf install
    
    # Run the just command with provided arguments
    echo "⚡ Executing: just {{args}}"
    just {{args}}

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