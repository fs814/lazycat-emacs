;;; +download.el --- description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 John Doe
;;
;; Author: John Doe <http://github/shengfeng>
;; Maintainer: John Doe <john@doe.com>
;; Created: November 10, 2020
;; Modified: November 10, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/shengfeng/+download
;; Package-Requires: ((emacs 28.0.50) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  description
;;
;;; Code:

(fsdir-filelist "download")
(fsdir-setq "download" "officials" "c:/Users/shengfeng/Downloads/")
(fsdir-setq "download" "baidu" "F:/BaiduNetdiskDownload")

(provide '+download)
;;; +download.el ends here
