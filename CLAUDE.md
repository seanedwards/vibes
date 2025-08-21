# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Purpose

This repository serves as a test bench for Claude Code GitHub Actions, allowing testing and validation of AI-powered automation features within GitHub workflows.

## Claude Code GitHub Actions Overview

Claude Code GitHub Actions enables AI-powered automation in GitHub workflows through simple `@claude` mentions in PRs and issues. The system can:

- Create complete pull requests from issue descriptions
- Implement features and fix bugs automatically
- Follow project standards defined in CLAUDE.md
- Provide implementation guidance and code reviews
- Work with direct Anthropic API, AWS Bedrock, or Google Vertex AI

### Key Features
- **Instant PR creation**: Turn descriptions into complete PRs
- **Automated implementation**: Convert issues to working code
- **Standards compliance**: Respects CLAUDE.md guidelines and existing patterns
- **Simple setup**: Quick installation via `/install-github-app` command
- **Secure by default**: Code stays on GitHub's runners

### Setup Methods
1. **Quick setup**: Use `/install-github-app` command in Claude Code terminal
2. **Manual setup**: Install GitHub app, add API secrets, copy workflow files
3. **Enterprise setup**: Configure with AWS Bedrock or Google Vertex AI for data residency control

### Usage Examples
- `@claude implement this feature based on the issue description`
- `@claude how should I implement user authentication for this endpoint?`
- `@claude fix the TypeError in the user dashboard component`

### Configuration
- Create CLAUDE.md for project-specific guidelines and code standards
- Use GitHub Secrets for API keys (never commit directly)
- Configure appropriate timeouts and turn limits
- Consider GitHub Actions minutes and API token costs

## Development Commands

*To be added when build system is established*

## Architecture Overview

*To be documented as the project structure emerges*

## Key Guidelines

- This is a test bench repository for validating Claude Code GitHub Actions functionality
- Development setup and build processes should be documented here as they are established
- Update this file as the project architecture and tooling are defined
- Focus on testing various GitHub Actions integration scenarios