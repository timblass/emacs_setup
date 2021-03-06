# Emacs Setup
Customizing Emacs as a general programming editor

## Why use Emacs?
It's free, works great, is customizable, and the learning
curve isn't too steep. A lot of people use Emacs, so there is a
good amount of documenation on how to do all sorts of things with
it, and plenty of answers about it on Stack Exchange.

I like it because it has lots of useful keyboard commands
and I find that I can do pretty much anything I want right
from the keyboard. The reliance on the `Ctrl` key is a bit
unfortunate, but if you want you can replace `Caps Lock`
with `Ctrl` and save your left pinky finger.

## What about other editors?
Why do I use Emacs instead of vi? Because I learned Emacs first
and don't have a good reason to change. Vi is good too, and I use
it sometimes, but I mostly use Emacs.

I don't like Emacs for writing Markdown, so I use Atom for that
because it has a nice Markdown viewer.

[Use whatever you like.](http://xkcd.com/378/)

## What's here?
I copied my `.emacs` file to this repo. It has comments in it
to explain what's what, but a quick overview is this:
- Include MELPA package manager
- basic stuff like displaying the cursor's column, deleting trailing whitespace automatically, etc.
- add column marker to shell scripts (don't go past 80 columns)
- Python Pep8 compliance packages
- jedi for Python tab-completion (I'm on the fence with this one, right now these lines are commented out)
- solarized theme setup
- move automatic backup files (file.name~) to a ``./saves/`` directory

## Dependencies
- The `pychecker` script must be added to your system path.
- [flymake](https://www.emacswiki.org/emacs/FlyMake) checks syntax
- You'll want to use MELPA to install packages. I used it to get the
Solarized theme.


-- To do: write out all dependencies!
