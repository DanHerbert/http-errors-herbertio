#!/usr/bin/env bash
echo 'Beware of new files. They will not automatically be compiled'
sleep 2

shopt -s extglob

# Setup stylus watcher, and inline images as data URIs
stylus_cmd="stylus --watch --inline --out ./css/ styl/ &"
if ! command -v stylus &> /dev/null; then
    npx --package 'stylus' "$stylus_cmd"
else
    "$stylus_cmd"
fi

# Globbing is required for the templates path, hence the shellcheck disablings.
pug_cmd="pug3 --pretty --watch --out ./html ./pug/!(*-base).pug &"
if ! command -v pug3 &> /dev/null; then
    # shellcheck disable=SC2086
    npx --package '@anduh/pug-cli' $pug_cmd
else
    # shellcheck disable=SC2086
    $pug_cmd
fi

# Keep the script running until something crashes or Ctrl+C
wait
