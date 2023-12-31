# twine-sugarcube.vim – vim syntax for Twine+Sugarcube

![](doc/ex.jpg)

A relatively simple syntax highlighter for vim, based on
[thricedotted's gist](https://gist.github.com/thricedotted/6590696).

Improvements/Fixes:

* HTML and Javascript are fully supported, by including the regular vim syntax
files for them where appropriate
* More [Sugarcube2](http://www.motoslave.net/sugarcube/2/docs/) keywords are
supported (still incomplete)
* Hard-coding links to be red clashed with vim7.3+'s built in spellchecker, this
was removed

To avoid name conflicts, the syntax is now named `twsc` instead of `twee`; it
still assumes the `.tw` file extension for use with
[tweego](https://github.com/tmedwards/tweego).

## Installation

Assuming vim8, just run `git clone https://github.com/creshal/twine-sugarcube.vim.git ~/.vim/pack/twsc/start/twine-sugarcube/`.

Other plugin managers are not tested, but should work, probably. Alternatively,
copy the `syntax` and `ftdetect` directories to `~/.vim/`.
