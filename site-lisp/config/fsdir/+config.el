;;; +config.el --- description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 John Doe
;;
;; Author: John Doe <http://github/shengfeng>
;; Maintainer: John Doe <john@doe.com>
;; Created: August 04, 2020
;; Modified: August 04, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/shengfeng/+config
;; Package-Requires: ((emacs 28.0.50) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  description
;;
;;; Code:

(fsdir-filelist "config")
(fsdir-setq "config" "hlissner" (concat fsdir-sourcecode-dir "emacsconf/hlissner/"))
(fsdir-setq "config" "hlissner-doom" (concat fsdir-config-hlissner-dir ".doom.d/"))

;;(provide '+config)
;;; +config.el ends here
