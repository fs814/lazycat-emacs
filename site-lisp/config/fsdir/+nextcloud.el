;;; +nextcloud.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 John Doe
;;
;; Author: John Doe <https://github.com/shengfeng>
;; Maintainer: John Doe <john@doe.com>
;; Created: May 25, 2021
;; Modified: May 25, 2021
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/shengfeng/+nextcloud
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(setq fsdir-nextcloud-dir (cond
                           (IS-WINDOWS
                                 "e:/nextcloud/"
                            )
                           (IS-MAC
                            "/Users/fs814/sourcecode/nextcloud/")
                                ))
(setq fsdir-nextlarge-dir (cond
                           (IS-WINDOWS
                                 "e:/nextlarge/"
                            )
                           (IS-MAC
                            "/Users/fs814/sourcecode/nextlarge/")
                                ))
(setq fsdir-nextsmall-dir (cond
                           (IS-WINDOWS
                                 "e:/nextsmall/"
                            )
                           (IS-MAC
                            "/Users/fs814/sourcecode/nextsmall/")
                                ))
(fsdir-filelist "nextcloud")
(fsdir-setq "nextcloud" "book" (concat fsdir-nextcloud-dir "book/"))
(fsdir-setq "nextcloud" "mobileorg" (concat fsdir-nextcloud-dir "mobileorg/"))
(fsdir-setq "nextcloud" "paper" (concat fsdir-nextcloud-dir "paper/"))
(fsdir-setq "nextcloud" "rdrview" (concat fsdir-nextcloud-dir "rdrview/"))
(fsdir-setq "nextcloud" "soft" (concat fsdir-nextcloud-dir "soft/"))
(fsdir-setq "nextcloud" "video" (concat fsdir-nextcloud-dir "video/"))
(fsdir-setq "nextcloud" "work" (concat fsdir-nextcloud-dir "work/"))

(provide '+nextcloud)
;;; +nextcloud.el ends here
