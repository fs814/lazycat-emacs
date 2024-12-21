;;; +emacs.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 John Doe
;;
;; Author: John Doe <john@doe.com>
;; Maintainer: John Doe <john@doe.com>
;; Created: April 21, 2022
;; Modified: April 21, 2022
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/fs814/+emacs
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(fsdir-filelist "emacs")

(fsdir-setq "emacs" "" (concat fsdir-sourcecode-editor-emacs-fswork-dir))
(fsdir-setq "emacs" "admin" (concat fsdir-sourcecode-editor-emacs-fswork-dir "admin/"))
(fsdir-setq "emacs" "build-aux" (concat fsdir-sourcecode-editor-emacs-fswork-dir "build-aux/"))
(fsdir-setq "emacs" "doc" (concat fsdir-sourcecode-editor-emacs-fswork-dir "doc/"))
(fsdir-setq "emacs" "etc" (concat fsdir-sourcecode-editor-emacs-fswork-dir "etc/"))
(fsdir-setq "emacs" "info" (concat fsdir-sourcecode-editor-emacs-fswork-dir "info/"))
(fsdir-setq "emacs" "leim" (concat fsdir-sourcecode-editor-emacs-fswork-dir "leim/"))
(fsdir-setq "emacs" "lib" (concat fsdir-sourcecode-editor-emacs-fswork-dir "lib/"))
(fsdir-setq "emacs" "lib-src" (concat fsdir-sourcecode-editor-emacs-fswork-dir "lib-src/"))
(fsdir-setq "emacs" "lisp" (concat fsdir-sourcecode-editor-emacs-fswork-dir "lisp/"))
(fsdir-setq "emacs" "lwlib" (concat fsdir-sourcecode-editor-emacs-fswork-dir "lwlib/"))
(fsdir-setq "emacs" "m4" (concat fsdir-sourcecode-editor-emacs-fswork-dir "m4/"))
(fsdir-setq "emacs" "modules" (concat fsdir-sourcecode-editor-emacs-fswork-dir "modules/"))
(fsdir-setq "emacs" "msdos" (concat fsdir-sourcecode-editor-emacs-fswork-dir "msdos/"))
(fsdir-setq "emacs" "nextstep" (concat fsdir-sourcecode-editor-emacs-fswork-dir "nextstep/"))
(fsdir-setq "emacs" "nt" (concat fsdir-sourcecode-editor-emacs-fswork-dir "nt/"))
(fsdir-setq "emacs" "oldXMenu" (concat fsdir-sourcecode-editor-emacs-fswork-dir "oldXMenu/"))
(fsdir-setq "emacs" "src" (concat fsdir-sourcecode-editor-emacs-fswork-dir "src/"))
(fsdir-setq "emacs" "test" (concat fsdir-sourcecode-editor-emacs-fswork-dir "test/"))


(provide '+emacs)
;;; +emacs.el ends here
