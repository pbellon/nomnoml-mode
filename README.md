# nomnoml-mode
Nomnoml is a tool to draw UML diagrams based on a simple syntax. [Check it out](http://nomnoml.com/).

## Prequisites
You'll need to have nomnoml installed on your machine and have the nomnoml program accessible from the $PATH variable.
```sh
$> npm install -g nomnoml
```

## Install nomnoml-mode
```sh
git clone https://github.com/pbellon/nomnoml-mode.git ~/.emacs.d/nomnoml-mode
```
Then add to your init.el:
```lisp
(load "~/.emacs.d/nomnoml-mode/nomnoml")
(require 'nomnoml-mode)
```
