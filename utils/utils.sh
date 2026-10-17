
#!/usr/bin/env bash
# ==============================================================================
# REUSABLE SHELL UTILITIES (COLOR DEFINITIONS & SPINNER HOOKS)
# ==============================================================================

# Guard block: Prevents the file from being sourced multiple times needlessly
[ -n "${_UTILS_SH_LOADED:-}" ] && return || readonly _UTILS_SH_LOADED=1

# --- Color & Formatting Definitions ---
BLUE='\033;34m'
CYAN='\033;36m'
GREEN='\033;32m'
YELLOW='\033;33m'
RED='\033;31m'
BOLD='\033;1m'
NC='\033[0m' # No Color

# --- Interactive Loading Spinner ---
# Usage: run_with_spinner "Message" command_to_run
run_with_spinner() {
    local msg="$1"
    shift
    
    # Create a unique temporary log file to catch errors from background commands
    local tmp_log
    tmp_log=$(mktemp)
    
    # Run the command in the background, redirecting stdout/stderr to the temp file
    "$@" > "$tmp_log" 2>&1 &
    local pid=$!
    local spinner='|/-\'
    
    # Hide terminal cursor to make it look cleaner
    tput civvis 2>/dev/null
    
    while kill -0 $pid 2>/dev/null; do
        for i in $(seq 0 3); do
            # Prints the message and the spinner, returning the cursor to the start of the line (\r)
            printf "\r${YELLOW}:: %s...  ${CYAN}%s${NC}" "$msg" "${spinner:$i:1}"
            sleep 0.1
        done
    done
    
    # Restore terminal cursor
    tput cnorm 2>/dev/null
    
    # Check command exit status
    wait $pid
    local status=$?
    if [ $status -eq 0 ]; then
        printf "\r${YELLOW}:: %s...  ${GREEN}Done!${NC}\n" "$msg"
        rm -f "$tmp_log"
        return 0
    else
        printf "\r${YELLOW}:: %s...  ${RED}Failed!${NC}\n" "$msg"
        printf "${RED}  ! Error log output below:${NC}\n" >&2
        sed 's/^/    /' "$tmp_log" >&2  # Indent the error log for readability
        rm -f "$tmp_log"
        return $status
    fi
}
