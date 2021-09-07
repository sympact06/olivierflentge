#!/bin/bash
# Copyright Olivier Flentge
# Swibe

PS3='Swibe AUTUMN Start menu: '
options=("Rebuild Client" "Restart/Restart API/Server/CDN" "Start alles" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Rebuild Client")
            cd revite
            yarn build
            cd 
            cd revolt
            clear
            echo "Klaar met rebuild"
            ;;
        "Start/Restart API/Server/CDN")
        cd
        cd revolt
        docker-compose up -d
            ;;
        "Start Alles")
        cd
        cd revolt
        docker-compose up -d
        cd revolt
        yarn start
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
