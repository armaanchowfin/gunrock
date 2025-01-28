#!/bin/bash

source common

FILE_MTX=./soc-twitter-2010.mtx
FILE_ZIP=./soc-twitter-2010.zip

if [ ! -f "$FILE_MTX" ]; then
    if [ ! -f "$FILE_ZIP" ]; then
        wget $BASE_URL/soc-twitter-2010.zip
    fi
    unzip soc-twitter-2010.zip
    if [ $? -eq 1 ]; then
        echo "[CACTUS] Problem extracting soc-twitter-2010.zip"
        rm -f soc-twitter-2010.zip
        exit 1
    fi
    rm -f soc-twitter-2010.zip
fi

/home/ub-11/Armaan_Puru_Flyt/flyt-evaluation/0_WORKLOADS/gunrock/build_release/bin/bfs --market  $FILE_MTX

# More information https://networkrepository.com/networks.php
