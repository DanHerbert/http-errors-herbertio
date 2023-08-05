#!/usr/bin/env bash
echo 'Beware of new files. They will not automatically be compiled'
sleep 2

# Setup stylus watcher, and inline images as data URIs
stylus --watch --inline --out ./css/ styl/ &
# Setup pug templates
pug3 --pretty --watch --out ./html ./pug &
# Keep the script running until something crashes or Ctrl+C
wait
