#!/bin/bash

WIDTH=10
HEIGHT=20
EMPTY="."
FILLED="#"
SLEEP_TIME=0.5

declare -A field
for ((i=0; i<HEIGHT; i++)); do
    for ((j=0; j<WIDTH; j++)); do
        field[$i,$j]=$EMPTY
    done
done

function display_field {
    clear
    for ((i=0; i<HEIGHT; i++)); do
        for ((j=0; j<WIDTH; j++)); do
            echo -n "${field[$i,$j]}"
        done
        echo
    done
}

function check_lines {
    for ((i=0; i<HEIGHT; i++)); do
        full=true
        for ((j=0; j<WIDTH; j++)); do
            if [ "${field[$i,$j]}" == "$EMPTY" ]; then
                full=false
                break
            fi
        done
        if [ "$full" == true ]; then
            for ((k=i; k>0; k--)); do
                for ((j=0; j<WIDTH; j++)); do
                    field[$k,$j]=${field[$((k-1)),$j]}
                done
            done
            for ((j=0; j<WIDTH; j++)); do
                field[0,$j]=$EMPTY
            done
        fi
    done
}

while true; do
    shape=$((RANDOM % 2))
    x=4
    y=0
    if [ $shape -eq 0 ]; then
        field[$y,$x]=$FILLED
        field[$y,$((x+1))]=$FILLED
    else
        field[$y,$x]=$FILLED
        field[$y,$((x+1))]=$FILLED
        field[$((y+1)),$x]=$FILLED
        field[$((y+1)),$((x+1))]=$FILLED
    fi

    while true; do
        display_field
        sleep $SLEEP_TIME
        if [ $shape -eq 0 ]; then
            if [ $((y+1)) -lt $HEIGHT ] && [ "${field[$((y+1)),$x]}" == "$EMPTY" ] && [ "${field[$((y+1)),$((x+1))]}" == "$EMPTY" ]; then
                ((y++))
            else
                break
            fi
        else
            if [ $((y+1)) -lt $HEIGHT ] && [ "${field[$((y+1)),$x]}" == "$EMPTY" ] && [ "${field[$((y+1)),$((x+1))]}" == "$EMPTY" ]; then
                ((y++))
            else
                break
            fi
        fi
    done

    if [ $shape -eq 0 ]; then
        field[$y,$x]=$FILLED
        field[$y,$((x+1))]=$FILLED
    else
        field[$y,$x]=$FILLED
        field[$y,$((x+1))]=$FILLED
        field[$((y+1)),$x]=$FILLED
        field[$((y+1)),$((x+1))]=$FILLED
    fi

    check_lines
done
