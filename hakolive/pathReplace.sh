#!/bin/bash
for file in `\find ./src/HakoLive-server -name '*.go'`; do
    ${file}に対して処理
    sed -i -e "s:HakoLive-server/:github.com/work/:g" $file
done