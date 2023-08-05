#!/usr/bin/env bash
# NOTE: This script only generates the html files in a production-ready format.
# It does not copy them over to their final destination, wherever that may be.

vercomp () {
    if [[ $1 == $2 ]]
    then
        echo -n 0
        return
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            echo -n 1
            return
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            echo -n 2
            return
        fi
    done
    echo -n 0
    return
}

set -eux

# Build the CSS
# Older versions of stylus have base64 encoding problems that require recent
# versions of the app to encode things properly.
if command -v stylus &> /dev/null && [[ $(vercomp "$(stylus --version 2>&1)" '0.59.0') -ge '0' ]]; then
    stylus --compress --inline --out ./css/ styl/
else
    npx 'stylus@>=0.59.0' --compress --inline --out ./css/ styl/
fi

# Build the HTML, which inlines the CSS
if ! command -v pug3 &> /dev/null; then
    # Unfortunately, there's no easy way to compare pre-release semvers
    npx --package '@anduh/pug-cli@>=1.0.0-alpha8' pug3 --out ./html ./pug
else
    pug3 --out ./html ./pug
fi

# Get rid of the base template
rm ./html/error-base.html

# Rename a class for index so it makes more sense.
sed -i -- 's/error-name/page-name/g' ./html/index.html
