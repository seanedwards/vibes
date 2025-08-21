# Justfile for vibes - Claude Code GitHub Actions test bench
# Run with `just <command>` or `just --list` to see available commands

# Default recipe - shows help
default:
    @just --list

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