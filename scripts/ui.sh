#!/usr/bin/env bash

trap 'echo -ne "\033[0m"' EXIT

C_MAIN='\033[38;2;186;230;253m'    
C_ACCENT='\033[38;2;96;165;250m'  
C_DIM='\033[38;2;71;85;105m'     
C_GREEN='\033[38;2;74;222;128m' 
C_YELLOW='\033[38;2;250;204;21m'
C_RED='\033[38;2;248;113;113m' 
C_BOLD='\033[1m'
C_RESET='\033[0m'

info() {
    echo -e "${C_MAIN}${C_BOLD} ╭─ 󰓅 $1${C_RESET}"
}

substep() {
    echo -e "${C_MAIN}${C_BOLD} │  ${C_DIM}❯ ${C_RESET}$1"
}

success() {
    echo -e "${C_MAIN}${C_BOLD} ╰─ ${C_GREEN}✔ ${C_RESET}$1\n"
}

warn() {
    echo -e "${C_MAIN}${C_BOLD} │  ${C_YELLOW}⚠ ${C_RESET}$1"
}

error() {
    echo -e "${C_MAIN}${C_BOLD} ╰─ ${C_RED}✘ ${C_RESET}$1\n"
}

pkg_ok() {
    echo -e "${C_MAIN}${C_BOLD} │  ${C_GREEN}󰄬 ${C_RESET}$1"
}

pkg_fail() {
    echo -e "${C_MAIN}${C_BOLD} │  ${C_RED}󰅖 ${C_RESET}$1"
}

run_step() {
    local message="$1"
    shift

    info "$message"

    "$@" 2>&1 | while IFS= read -r line; do
        substep "$line"
    done

    local status=${PIPESTATUS[0]}

    if [ $status -eq 1 ]; then
        return $status
    fi
}

finish() {
    echo -e "${C_MAIN}${C_BOLD}"
    echo " ╭──────────────────────────────────────────╮"
    echo " │              󰄬 ALL DONE                  │"
    echo " ╰──────────────────────────────────────────╯"
    echo -e "${C_RESET}"
}
