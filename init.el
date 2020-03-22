(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(add-to-list 'package-pinned-packages '(cider . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(projectile . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(magit . "melpa-stable") t)
(add-to-list 'package-pinned-packages '(editorconfig . "melpa-stable") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages
  '(paredit
    clojure-mode
    clojure-mode-extra-font-locking
    cider
    ido-completing-read+
    smex
    projectile
    rainbow-delimiters
    tagedit
    magit
    flycheck
    flycheck-clj-kondo
    exec-path-from-shell
    dumb-jump
    company
    editorconfig
    move-text
    multiple-cursors
    color-theme-sanityinc-tomorrow
    elpy
    blacken
    web-mode
    add-node-modules-path))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path "~/.emacs.d/customizations")

(load "shell-integration.el")
(load "navigation.el")
(load "ui.el")
(load "editing.el")
(load "misc.el")
(load "elisp-editing.el")
(load "setup-clojure.el")
(load "setup-js.el")
(load "setup-python.el")

(custom-set-variables
 '(coffee-tab-width 2)
 '(package-selected-packages (quote (spinner sesman queue parseedn))))
(custom-set-faces)
