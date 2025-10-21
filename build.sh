#!/usr/bin/env bash

if ! command -v pandoc &> /dev/null; then
    echo "错误：本脚本依赖 pandoc，请先安装 pandoc。" >&2
    exit 1
fi

for dir in */; do
    dirname="${dir%/}"
    md_files=("$dir"*.md)

    if [ -e "${md_files[0]}" ]; then
        pandoc "${md_files[0]}" -o "${dirname}.epub" \
            --resource-path="$dir" \
            --metadata title="$dirname" \
            --embed-resources \
            --toc
    fi
done