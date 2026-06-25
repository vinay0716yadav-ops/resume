#!/bin/bash

while true
do
    git add .

    if ! git diff --cached --quiet; then
        VERSION=$(date +"%Y%m%d-%H%M%S")

        git commit -m "Auto update $VERSION"
        git push origin main
    fi

    sleep 10
done
