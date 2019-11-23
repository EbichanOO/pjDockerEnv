#!/bin/bash
for file in `\find ./src/Mimiuchi-server -name '*.go'`; do
    ${file}に対して処理
    sed -i -e "s:\.\./:github.com/work/:g" -e "s:\./:github.com/work/:g" $file
done