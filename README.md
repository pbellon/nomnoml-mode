# nomnoml-mode
Nomnoml is a tool to draw UML diagrams based on a simple syntax. [Check it out](http://nomnoml.com/).
This mode is based on [mermaid-mode](https://github.com/shen390s/mermaid-mode)'s code.

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
Once setup you should reload this `init.el` with the `load-file` emacs command.
This mode will be automatically enabled for all files ending with `.uml`.

## Keybindings
First: `C-c C-c` to compile 
Then: `C-c C-v` to view.
