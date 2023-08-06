#!/usr/bin/env bash
# NOTE: This script only generates the html files in a production-ready format.
# It does not copy them over to their final destination, wherever that may be.

shopt -s extglob

set -eux

# Build the CSS
stylus_cmd="stylus --compress --inline --out ./css/ styl/"
if ! command -v stylus &> /dev/null; then
    npx --package 'stylus' "$stylus_cmd"
else
    $stylus_cmd
fi

# Build the HTML, which inlines the CSS
# Globbing is required for the templates path, hence the shellcheck disablings.
pug_cmd="pug3 --out ./html ./pug/!(*-base).pug"
if ! command -v pug3 &> /dev/null; then
    # shellcheck disable=SC2086
    npx --package '@anduh/pug-cli' $pug_cmd
else
    # shellcheck disable=SC2086
    $pug_cmd
fi

# Rename a class for index so it makes more semantic sense.
sed -i -- 's/error-name/page-name/g' ./html/index.html
