;;; +neovim.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 John Doe
;;
;; Author: John Doe <john@doe.com>
;; Maintainer: John Doe <john@doe.com>
;; Created: April 21, 2022
;; Modified: April 21, 2022
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/fs814/+neovim
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(fsdir-filelist "neovim")

(fsdir-setq "neovim" "" (concat fsdir-sourcecode-editor-neovim-dir))
(fsdir-setq "neovim" "build" (concat fsdir-neovim-dir "build/"))
(fsdir-setq "neovim" "ci" (concat fsdir-neovim-dir "ci/"))
(fsdir-setq "neovim" "cmake" (concat fsdir-neovim-dir "cmake/"))
(fsdir-setq "neovim" "config" (concat fsdir-neovim-dir "config/"))
(fsdir-setq "neovim" "contrib" (concat fsdir-neovim-dir "contrib/"))
(fsdir-setq "neovim" "man" (concat fsdir-neovim-dir "man/"))
(fsdir-setq "neovim" "packaging" (concat fsdir-neovim-dir "packaging/"))
(fsdir-setq "neovim" "runtime" (concat fsdir-neovim-dir "runtime/"))
(fsdir-setq "neovim" "scripts" (concat fsdir-neovim-dir "scripts/"))
(fsdir-setq "neovim" "snap" (concat fsdir-neovim-dir "snap/"))
(fsdir-setq "neovim" "src" (concat fsdir-neovim-dir "src/"))
(fsdir-setq "neovim" "test" (concat fsdir-neovim-dir "test/"))
(fsdir-setq "neovim" "third-party" (concat fsdir-neovim-dir "third-party/"))

(provide '+neovim)
;;; +neovim.el ends here
