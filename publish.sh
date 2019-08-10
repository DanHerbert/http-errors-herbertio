#!/usr/bin/env bash
set -x
# Build the CSS
stylus --compress --inline --out ./css/ styl/
# Build the HTML, which inlines the CSS
pug --out ./html ./pug
# Get rid of the base template
rm ./html/error-base.html
# Rename a class for index so it makes more sense.
sed -i -- 's/error-name/page-name/g' ./html/index.html
