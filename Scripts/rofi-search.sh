#!/bin/bash
xdg-open "$(rg --no-messages --files /home/computerdad/Desktop /home/computerdad/Downloads /home/computerdad/Pictures \
    -g "!{*.srt,*.rar,*.txt,*.zip,*.nfo}" | rofi -threads 0 \
    -theme-str "#window { width: 900;}" \
    -dmenu -sort -sorting-method fzf -i -p "find")"
