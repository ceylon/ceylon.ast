Information for contributors
============================

First of all…
-------------
These are guidelines, not rules.
It would be nice if you read and followed them when contributing, but if you submit a pull request and didn’t follow all these rules, we’ll probably happily accept it anyways :)

Coding style
------------
All code *should* be formatted with [`ceylon.formatter`](https://github.com/lucaswerkmeister/ceylon.formatter).

(You can check that you’re only pushing correctly formatted code with [this pre-push Git hook](https://gist.github.com/lucaswerkmeister/08eb5e54db95d17f42b1).)

We’ll most likely keep the default settings;
if not, we’ll put the settings in the Ceylon config file, where the formatter will [pick them up automatically](https://github.com/lucaswerkmeister/ceylon.formatter/issues/32), so you don’t need to worry about that.

Commits
-------
Small commits are preferred – they are easier to review.
If you’ve been working for a while and want to commit your changes in several parts, you can use `git commit -p` or `git add -p` to commit/add only parts of your changes.

(If you make your commits *very* small, you can still do a `git rebase --interactive origin/master` to squash small fixes and clean up history in general before you submit your pull request.)

Commit tests separately; that way, it’s possible to revert the associated changes without reverting the tests.
As all tests on master *should* always be green, the tests should usually be committed directly after the changes;
an exception to this is when the test for a bug has been around for a while (ignored) before a fix was found (in which case the fix commit would un-ignore the test).

### Commit messages
Follow [these guidelines](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html); TLDR:
* first line: Short (≤50 chars, if possible) summary in imperative (“Fix X”, not “Fixed X” or “Fixes X”)
  * you can specify the file or general part of the project the commit affects like this: “CONTRIBUTING.md: add info”
* blank line
* body: wrap at ~72 characters
* markdown-ish (bullets, \*emphasis\*, etc.)

If you use `vim` to write commit messages, these guidelines should automatically be applied (keep your first line yellow).
