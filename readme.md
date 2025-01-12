# Custom ZSH Prompt with Dynamic Git Status and Colors

This script customizes your ZSH prompt to display a dynamically colored Git status, file counts, and an enhanced directory view with the last folder highlighted. It uses ANSI escape sequences to define custom colors, making your terminal experience visually appealing and informative.

## Features

1. **Custom Colors**:
   - Bright Green (`#0AE448`) for clean Git status.
   - Bright Yellow (`#FFD300`) for modified files.
   - Bright Red (`#FA003F`) for merge conflicts.
   - Bright Cyan (`#1BE7FF`) for staged changes.
   - Soft Yellow (`#FFF8B7`) for directory highlights.
   - Gray (`#757575`) for general text and arrows.
   - Purple (`#B200B2`) for the last directory in the path.

2. **Dynamic Git Status**:
   - Displays the current branch name with colors based on the repository's state.
   - Shows counts for:
     - Modified files.
     - Staged files.
     - Conflicted files.
   - Adds relevant emojis for better visualization:
     - ✅ for clean repos.
     - 🚀 for staged changes.
     - ± for modified files.
     - ⛔ for merge conflicts.

3. **Directory Highlighting**:
   - Displays the full directory path, with the last directory highlighted in purple.

4. **Prompt Design**:
   - Multi-line prompt:
     - First line shows the current directory path and Git status.
     - Second line is a simple input marker (`►`).
   - Right prompt (`RPROMPT`) displays the current time.

## Preview

Here’s an example of the ZSH prompt in action:

![Custom ZSH Prompt Screenshot](https://i.ibb.co/518CzKd/Screenshot-2025-01-12-at-3-03-09-p-m.png)

In this example:
- `~/projects/my-repo` is the current directory, with `my-repo` in purple.
- The Git branch is clean, indicated by ✅.

## Usage

1. Copy the script into your ZSH configuration file (e.g., `~/oscru.zsh-theme`).
2. Reload your terminal or run:
   ```bash
   source ~/oscru.zsh-theme
