# Ranmocy Emacs Configurations

Emacs-Lisp is a very powerful language used by Emacs.
It is so powerful that sometimes makes people confused.

This project just aims to set some little rules to make the custom files a little bit more clearly.

## Philosophy
* Hierarchy
* Modularization
* Decoupling

## File Rules
* Every file here should be packaged to `provide` a feature and be `require` by others.
* A file provide a feature to setup a package should be named with prefix `econf-`.
* A file provide a feature to extend a package should be named with prefix `ext-`.
* `econf-test.el` is used for test codes temporarily.

## Path Rules
* Every econf files are under `packs/`, separated into different directory by functionality.
* Packages are managed by `el-get` under `el-get/` unitedly.
* Themes are under `themes/` used by Emacs 24 integrated themes management.
* Snippets are under `snippets/` used by `yasnippet`.
* Everything sensitive is under `personal/`.

## Code Rules
* Atomize.
* Auto-load every single file.
* Duck Typing. Detect before use. Disable with a message better than raise errors with interruption.
* It should be able to adapt Mac OS and any distribution of GNU/Linux without modification.

## Contribute or Advise

    Clone && Modify && Push && Pull-request \n

or

    Tell( to: me, in: ways.any )

EMACS is a Evil Mixed A Configuration of S-expression
