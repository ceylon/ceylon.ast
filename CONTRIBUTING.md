Information for contributors
============================

Coding style
------------
All code *should* be formatted with the [`ceylon.formatter`](https://github.com/lucaswerkmeister/ceylon.formatter);
however, as no version of that has been released yet, we won’t enforce this rule for a while :)

We’ll most likely keep the default settings;
if not, we’ll put the settings in the Ceylon config file, where the formatter will [pick them up automatically](https://github.com/lucaswerkmeister/ceylon.formatter/issues/32), so you don’t need to worry about that.

Commit messages
---------------
Follow [these guidelines](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html); TLDR:
* first line: Short (≤50 chars, if possible) summary in imperative (“Fix X”, not “Fixed X” or “Fixes X”)
  * you can specify the file or general part of the project the commit affects like this: “CONTRIBUTING.md: add info”
* blank line
* body: wrap at ~72 characters
* markdown-ish (bullets, \*emphasis\*, etc.)

If you use `vim` to write commit messages, these guidelines should automatically be applied (keep your first line yellow).

Last but not least…
-------------------
Don’t worry; if you submit a pull request and didn’t follow all these rules, we’ll probably happily accept it anyways :)
