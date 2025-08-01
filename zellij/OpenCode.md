# Zellij Configuration Repository

## Project Type
This is a Zellij terminal multiplexer configuration directory containing KDL (KubeScript Document Language) configuration files.

## File Management Commands
- **Reload config**: `zellij action new-tab --name reload && zellij action run-command --cwd $(pwd) -- zellij action reload-config`
- **Backup config**: `cp config.kdl config.kdl.bak`
- **Validate config**: `zellij setup --check`

## Code Style Guidelines
- **File format**: KDL (KubeScript Document Language) syntax
- **Indentation**: 4 spaces, no tabs
- **Comments**: Use `//` for single-line comments, `/* */` for multi-line
- **Naming**: snake_case for keys and values
- **Structure**: Group related configurations in logical blocks
- **Theme**: Current theme is "dracula" 
- **Shell**: Default shell is "zsh"
- **Layout**: Default layout is "compact"

## Configuration Patterns
- Use `bind` blocks for keybindings with clear action descriptions
- Plugin definitions should include location and necessary parameters
- Boolean values are lowercase: `true`, `false`
- Strings are quoted when they contain spaces or special characters
- Configuration options should follow the official Zellij schema