;;; +buildtools.el --- description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 John Doe
;;
;; Author: John Doe <http://github/shengfeng>
;; Maintainer: John Doe <john@doe.com>
;; Created: August 26, 2020
;; Modified: August 26, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/shengfeng/+buildtools
;; Package-Requires: ((emacs 28.0.50) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  description
;;
;;; Code:

(setq fsdir-buildtools-cmake-dir "C:/Program Files/CMake/bin/")

(fsdir-filelist "buildtools")
(fsdir-setq "buildtools" "cmake" fsdir-buildtools-cmake-dir)

;; +buildtools.el ends here
