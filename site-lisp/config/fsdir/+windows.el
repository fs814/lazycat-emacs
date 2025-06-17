;;; +windows.el --- description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 John Doe
;;
;; Author: John Doe <http://github/shengfeng>
;; Maintainer: John Doe <john@doe.com>
;; Created: August 04, 2020
;; Modified: August 04, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/shengfeng/+windows
;; Package-Requires: ((emacs 28.0.50) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  description
;;
;;; Code:

(setq fsdir-windows-userprofile-dir
  (concat (getenv "USERPROFILE") "/"))

(setq fsdir-windows-appdata-dir
  (concat (getenv "APPDATA") "/"))

(fsdir-filelist "windows")
(fsdir-setq "windows" "download" (concat fsdir-windows-userprofile-dir "Downloads/"))
(fsdir-setq "windows" "document" (concat fsdir-windows-userprofile-dir "Documents/"))
(fsdir-setq "windows" "vscode-settings" (concat fsdir-windows-appdata-dir "Code/User/"))
(defun fsdir-open-windows-vscode-settings-dir ()
  (interactive)
  (dired fsdir-windows-vscode-settings-dir))

