;;; +marmoset.el --- description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 John Doe
;;
;; Author: John Doe <http://github/shengfeng>
;; Maintainer: John Doe <john@doe.com>
;; Created: August 04, 2020
;; Modified: August 04, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/shengfeng/+marmoset
;; Package-Requires: ((emacs 28.0.50) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  description
;;
;;; Code:

(setq fsdir-marmoset-dir (concat currentdisk ":/Program Files/Marmoset/Toolbag 3/data"))
(setq fsdir-marmoset-shader-dir (concat fsdir-marmoset-dir "/shader"))
(setq fsdir-marmoset-python-dir (concat fsdir-marmoset-dir "/python"))
(setq fsdir-marmoset-plugin-dir (concat fsdir-marmoset-dir "/plugin"))

(setq fsdir-marmoset-filelist
      `(
        ("marmoset" . ,fsdir-marmoset-dir)
        ("marmoset-shader" . ,fsdir-marmoset-shader-dir)
        ("marmoset-python" . ,fsdir-marmoset-python-dir)
        ("marmoset-plugin" . ,fsdir-marmoset-plugin-dir)
        ))

;;; +marmoset.el ends here
