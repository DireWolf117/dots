# Waybar Configuration

## Commands
- **Reload waybar**: `killall waybar && waybar &`
- **Test config**: `waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css`
- **Validate JSON**: `jsonlint config.jsonc` or `jq . config.jsonc`
- **Test script**: `bash scripts/time-of-day.sh`

## Code Style Guidelines
- **JSON files**: Use `.jsonc` extension for comments support
- **Indentation**: 2 spaces for JSON, shell scripts follow standard bash conventions
- **Naming**: kebab-case for CSS classes, camelCase for JSON properties
- **Colors**: Use hex colors (#000000, #ffffff, etc.)
- **Fonts**: Primary: "Inter", "SF Pro Display", fallback to sans-serif. Monospace: "JetBrainsMono Nerd Font"
- **Scripts**: Include shebang `#!/bin/bash`, use proper quoting, handle leading zeros with `${VAR#0}`
- **CSS**: Use specific selectors (#module-name), group related styles, include comments for complex layouts
- **Icons**: Use Nerd Font icons, test display before committing
- **Modules**: Separate icon and text variants using # suffix (e.g., pulseaudio#percentage)
- **Tooltips**: Disable with `"tooltip": false` for icons, enable with meaningful text for interactive elements
- **Spacing**: Use custom separators for visual grouping, consistent padding/margins
- **File organization**: Main config includes modular bar configs from bars/ directory
- **Script execution**: Reference scripts with full path from ~/.config/waybar/