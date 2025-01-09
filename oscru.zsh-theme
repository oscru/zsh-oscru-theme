# Define custom colors using ANSI escape sequences
ZSH_CUSTOM_GREEN="%{$(printf '\e[38;5;48m')%}"   # Bright green (#0AE448)
ZSH_CUSTOM_YELLOW="%{$(printf '\e[38;5;220m')%}" # Bright yellow (#ffd300)
ZSH_CUSTOM_RED="%{$(printf '\e[38;5;196m')%}"    # Bright red (#FA003F)
ZSH_CUSTOM_CYAN="%{$(printf '\e[38;5;45m')%}"    # Bright cyan (#1BE7FF)"
ZSH_CUSTOM_SOFT_YELLOW="%{$(printf '\e[38;5;230m')%}" # Soft yellow for directory (#fff8b7)
ZSH_CUSTOM_GRAY="%{$(printf '\e[38;5;240m')%}"  # Color #757575
ZSH_CUSTOM_PURPLE="%{$(printf '\e[38;5;129m')%}" # New Purple color (#b200b2)
ZSH_CUSTOM_ARROW="%{$(printf '\e[38;5;248m')%}" # Gray arrow color

# Function to extract the last directory and color it purple
function last_dir {
    echo ${PWD##*/} # Extract the last directory from the full path
}

# Git prompt prefix/suffix
ZSH_THEME_GIT_PROMPT_PREFIX=" "   # Space before branch name
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"  # Reset color after branch name

# Function to dynamically color the branch name based on Git status and show file counts
function git_prompt_status {
    local STATUS=$(git status --porcelain 2>/dev/null)
    local BRANCH=$(git branch --show-current 2>/dev/null)

    if [ -z "$BRANCH" ]; then
        # Not in a git repository
        echo ""
        return
    fi

    # Count files based on status
    local MODIFIED_COUNT=$(echo "$STATUS" | grep -E '^[ M]' | wc -l | tr -d ' ')
    local STAGED_COUNT=$(echo "$STATUS" | grep -E '^M' | wc -l | tr -d ' ')
    local CONFLICTED_COUNT=$(echo "$STATUS" | grep -E '^UU' | wc -l | tr -d ' ')

    # Determine branch color and append counts
    if [ "$CONFLICTED_COUNT" -gt 0 ]; then
        # Merge conflicts
        echo "${ZSH_CUSTOM_RED}${BRANCH} (${CONFLICTED_COUNT}⛔) ${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    elif [ "$STAGED_COUNT" -gt 0 ]; then
        # Unstaged changes (Modified, Added, Deleted, etc.)
        echo "${ZSH_CUSTOM_CYAN}${BRANCH} (${STAGED_COUNT}🚀) ${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    elif [ "$MODIFIED_COUNT" -gt 0 ]; then
        # Staged but unpushed changes
        echo "${ZSH_CUSTOM_YELLOW}${BRANCH} (${MODIFIED_COUNT}±) ${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    else
        # Clean repo
        echo "${ZSH_CUSTOM_GREEN}${BRANCH} ✅ ${ZSH_THEME_GIT_PROMPT_SUFFIX}"
    fi
}

# Main prompt with dynamic Git branch color, file counts, and full directory route with the last dir item in purple
PROMPT='%(?, ,%{$fg[red]%}FAIL: $?%{$reset_color%}
)
${ZSH_CUSTOM_GRAY}┌ ⚡️ ${ZSH_CUSTOM_GRAY}$(echo $PWD | sed "s|$HOME|~|")${ZSH_CUSTOM_ARROW} → ${ZSH_CUSTOM_PURPLE}$(last_dir)%{$reset_color%} $(git_prompt_status)
${ZSH_CUSTOM_GRAY}└ %{$fg_bold[white]%}► %{$reset_color%}'
RPROMPT="${ZSH_CUSTOM_CYAN}[%*]%{$reset_color%}"