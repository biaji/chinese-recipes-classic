#!/usr/bin/env bash

if ! command -v pandoc &> /dev/null; then
    echo "错误：本脚本依赖 pandoc，请先安装 pandoc。" >&2
    exit 1
fi

for dir in */; do
    dirname="${dir%/}"
    echo $dirname
    cd $dirname
    md_files=(*.md)
    echo $md_files

    if [ -e "${md_files[0]}" ]; then
        pandoc "${md_files[0]}" -o "../${dirname}.epub" \
            --metadata title="$dirname" \
            --toc
    fi
    cd ..
done