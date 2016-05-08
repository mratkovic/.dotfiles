#! /bin/bash

# toggle language

LANGS=('us' 'hr')
N="${#LANGS[@]}"

current_lang=$(setxkbmap -query | grep "layout" | sed -E 's/layout:\s+(.*)/\1/')
echo "Current layout: $current_lang"

curr_id=0
for i in ${!LANGS[@]}; do
    if [[ "${LANGS[$i]}" = "$current_lang" ]]; then
       curr_id=$i
    fi
done

next_id=$(((curr_id + 1) % N))
next_lang=${LANGS[$next_id]}
echo "Next layout: $next_lang"

setxkbmap $next_lang
