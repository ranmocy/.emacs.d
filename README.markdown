# Ranmocy Emacs Configurations

Emacs-Lisp is a very powerful language used by Emacs.
It is so powerful that sometimes makes people confused.

This project just aims to set some little rules to make the custom files a little bit more clearly.

## Philosophy
* Hierarchy
* Modularization

## File Rules
* Every file here should be packaged to `provide' a feature and be `require' by others.
* It should be able to adapt Mac OS and any distribution of GNU/Linux without modification.

## Path Rules
* Every customized files are under `customize/', separated into different directory by classifications.
* Packages are managed by `el-get' under `el-get/' unitedly.
* Third-parties packages out of the `el-get' will be placed under `plugins/'.
* Themes are under `themes/' used by Emacs 24 integrated themes management.
* Snippets are under `snippets/' used by `yasnippet'.
* Everything sensitive is in `personal-information.el'.

## Code Rules
* Atomize.
* Duck Typing. Detect before use. Disable with a message better than raise errors with interruption.
* Auto-load every single file.

## Contribute or Advise
    Clone it && Modify it && Push it && Pull-request it \n
or
    Tell me in any way.
