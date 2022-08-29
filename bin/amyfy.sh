#!/bin/bash

DOCS=$(ls README.* LICENSE CODE_OF_CONDUCT.md CONTRIBUTING.md pyproject.toml docs/conf.py docs/*.rst)
PROJECT=$(basename $PWD)

echo project: $PROJECT
echo docs: $DOCS
echo files: $@

update() {
    gsed -r -i \
        -e 's|20[0-9]* John Reese|2022 Amethyst Reese|gi' \
        -e 's|John Reese|Amethyst Reese|gi' \
        -e 's|team at john@noswap.com|team at contact@omnilib.dev|gi' \
        -e 's|john@noswap.com|amy@noswap.com|gi' \
        -e 's|jreese.sh|noswap.com|gi' \
        "$1"
}


for file in $DOCS $(find $PROJECT -name '*.py') $@; do
    update $file
done

grep -ir --exclude CHANGELOG.md jreese .
grep -ir --exclude CHANGELOG.md john .
