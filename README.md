# Custom HTTP Error Pages

I like writing messages that will only be seen by bots. This collection of
templates handles the main HTTP status error pages served to clients of my web
server.

The design goal was to have each page be purely standalone static HTML files,
with no external references for things like fonts, CSS, or images. This allows
them to be used for situations where there may be major server-side problems
that are causing most resources to be unable to load.

## Developing

These scripts require, at a minimum, `npm` & `npx` to be installed on your
system. They will run faster if you have also installed
[stylus CSS preprocessor](https://www.npmjs.com/package/stylus) and
[@anduh/pug-cli](https://www.npmjs.com/package/@anduh/pug-cli) on your system.

The `publish.sh` script will just compile the HTML files into the `/html/`
folder in the git repo, where they can then be copied wherever your server can
serve them from.

The `run.sh` script will compile all existing files and watch for changes and
recompile them automatically as they're modified. Beware that this does not pick
up any new files added after the script has been started.

## What they look like in action

These pages can be viewed on my personal website at the following URLs.

* [dan.herbert.io/errors/400.html](https://dan.herbert.io/errors/400.html)
* [dan.herbert.io/errors/401.html](https://dan.herbert.io/errors/401.html)
* [dan.herbert.io/errors/403.html](https://dan.herbert.io/errors/403.html)
* [dan.herbert.io/errors/404.html](https://dan.herbert.io/errors/404.html)
* [dan.herbert.io/errors/405.html](https://dan.herbert.io/errors/405.html)
* [dan.herbert.io/errors/408.html](https://dan.herbert.io/errors/408.html)
* [dan.herbert.io/errors/410.html](https://dan.herbert.io/errors/410.html)
* [dan.herbert.io/errors/413.html](https://dan.herbert.io/errors/413.html)
* [dan.herbert.io/errors/414.html](https://dan.herbert.io/errors/414.html)
* [dan.herbert.io/errors/415.html](https://dan.herbert.io/errors/415.html)
* [dan.herbert.io/errors/418.html](https://dan.herbert.io/errors/418.html) (With status header at [dan.herbert.io/error/418](https://dan.herbert.io/error/418))
* [dan.herbert.io/errors/429.html](https://dan.herbert.io/errors/429.html)
* [dan.herbert.io/errors/431.html](https://dan.herbert.io/errors/431.html)
* [dan.herbert.io/errors/500.html](https://dan.herbert.io/errors/500.html)
* [dan.herbert.io/errors/501.html](https://dan.herbert.io/errors/501.html)
* [dan.herbert.io/errors/502.html](https://dan.herbert.io/errors/502.html)
* [dan.herbert.io/errors/503.html](https://dan.herbert.io/errors/503.html)
* [dan.herbert.io/errors/504.html](https://dan.herbert.io/errors/504.html)
* [dan.herbert.io/errors/505.html](https://dan.herbert.io/errors/505.html)
* [dan.herbert.io/errors/index.html](https://dan.herbert.io/errors/index.html)