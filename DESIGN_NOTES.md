# Design Notes

This document captures the design intent of the dotfiles repository and highlights improvement ideas. It is intended for internal reference.

## Goals
- Centralize configuration for a consistent workstation setup.
- Keep deployments repeatable and low-risk via GNU Stow.
- Prefer small, composable scripts over large monolithic tools.
- Favor explicit keybindings and discoverable entry points.

## Architecture Overview
- **Stow packages** (`configs/`, `home/`, `git/`, `tmux/`, `vim/`, `emacs/`) map to target locations such as `~` and `~/.config`.
- **Scripts** (`scripts/`) provide focused utilities (display, audio, launchers, toggles).
- **Services** (`services/`) are systemd units managed via `deploy_services.sh`.
- **Deployment** is driven by `deploy.sh` which symlinks each package to its target.

## Display Management (Current Design)
- **Interactive layout** via `scripts/dmenu/display`, which reads `xrandr` state and prompts for layout.
- **Keybindings** in i3: XF86Display and `$mod+F7` open the display selector.
- **Assumptions**: 1–2 monitors, X11 + xrandr, manual selection on change.


## Audio Management (Current Design)
- **Volume/mute controls** in i3 use `pactl` and signal i3blocks for refresh.
- **Status display** in i3blocks reads current sink volume and mute state.
- **Assumptions**: default sink is correct; PulseAudio/pipewire-pulse is available.


## Improvement Ideas
- Add non-interactive flags to display scripts (e.g., `--single`, `--right`, `--left`) for docking workflows.
- Reload i3 only when outputs change to avoid unnecessary disruption.
- Extend display handling to 3+ monitors or add a “disable all but X” shortcut.
- Harden `xrandr` parsing to reduce driver-specific edge cases.
- Standardize audio control on one tool (all `pactl` or all `pulsemixer`).
- Detect default sink in the i3blocks script to handle sink changes.
- Debounce rapid volume key repeats to avoid frequent i3blocks signals.
- i3blocks: align refresh strategy (signals vs intervals) and document click actions per block.
- i3blocks: consolidate shared helpers (e.g., audio, network) to reduce duplicated logic across scripts.
- tmux: remove the unconditional `new-session -s BASE` if it conflicts with multi-session workflows.
- tmux: consider extracting theme-related settings into a separate file for easier tweaks.
- Add a quick keybind or script to respawn the dropdown terminal if it is killed.

## Operational Notes
- Most scripts assume specific tools (`xrandr`, `pactl`, `brightnessctl`, `dmenu`).
- Relative paths in scripts require running from the repo root unless normalized.
- System-wide changes (systemd units) require root.
- The dropdown terminal is started via i3 startup; if it is killed, there is no quick restart shortcut yet.

## Future Enhancements (Optional)
- Add a lightweight “health check” script to validate required dependencies.
- Document machine-specific exceptions (hardware quirks, monitor layout preferences).
- Consider a small README section with common recovery steps after stow conflicts.
