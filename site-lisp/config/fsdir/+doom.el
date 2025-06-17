;;; private/fsdir/+doom.el -*- lexical-binding: t; -*-

(fsdir-filelist "doom")
(fsdir-setq "doom" "emacs" (concat fsdir-base-dir "sourcecode/doom-emacs/"))
(fsdir-setq "doom" "modules" (concat fsdir-doom-emacs-dir "modules/"))

(fsdir-setq "doom" "babel" (concat fsdir-doom-emacs-dir "org-babel/"))
(fsdir-setq "doom" "image" (concat fsdir-doom-emacs-dir "image/"))
(fsdir-setq "doom" "orig-yasnippets" (concat fsdir-doom-emacs-dir "snippets/"))
(fsdir-setq "doom" "packages" (concat fsdir-doom-emacs-dir ".local/packages/"))
(fsdir-setq "doom" "server" (concat fsdir-doom-emacs-dir ".local/server/"))
(fsdir-setq "doom" "private" (concat fsdir-doom-modules-dir "privatenew/"))
(fsdir-setq "doom" "sdcv-data" (concat fsdir-doom-emacs-dir "sdcv-dict"))
(fsdir-setq "doom" "yasnippets" (concat fsdir-doom-emacs-dir "yas-snippets/"))
(fsdir-setq "doom" "yas-templates" (concat fsdir-doom-emacs-dir "templates/"))

(fsdir-setq "doom" "orgref" (concat fsdir-doom-emacs-dir "orgref/"))
(fsdir-setq "doom" "orgrefnotes" (concat fsdir-doom-emacs-dir "orgref/notes/"))
(fsdir-setq "doom" "orgrefbib" (concat fsdir-doom-emacs-dir "orgref/bib/"))
(setq fsfile-orgrefnotes-file (concat fsdir-doom-orgref-dir "notes.org"))
(setq fsfile-orgrefbib-file (concat fsdir-doom-orgref-dir "master.bib"))
