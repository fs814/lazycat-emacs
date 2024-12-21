;;; +macos.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2021 John Doe
;;
;; Author: John Doe <https://github.com/fs814>
;; Maintainer: John Doe <john@doe.com>
;; Created: July 03, 2021
;; Modified: July 03, 2021
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/fs814/+macos
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(fsdir-filelist "macos")
(fsdir-setq "macos" "library" "/Users/fs814/Library/")
(fsdir-setq "macos" "library-application-support" (concat fsdir-macos-library-dir "Application" " " "Support/"))
(fsdir-setq "macos" "library-application-support-alfred" (concat fsdir-macos-library-application-support-dir "Alfred/"))
(fsdir-setq "macos" "library-application-support-alfred-alfredpreferences" (concat fsdir-macos-library-application-support-alfred-dir "Alfred.alfredpreferences/"))
(fsdir-setq "macos" "library-application-support-alfred-alfredpreferences-workflows" (concat fsdir-macos-library-application-support-alfred-alfredpreferences-dir "workflows/"))
(fsdir-setq "macos" "library-application-support-alfred-alfredpreferences-workflows-douban" (concat fsdir-macos-library-application-support-alfred-alfredpreferences-workflows-dir "user.workflow.BD1D3E1B-E5A4-4BAB-BB3A-E51AFE8A74BC/"))
(fsdir-setq "macos" "library-application-support-alfred-alfredpreferences-workflows-evernote"
            (concat fsdir-macos-library-application-support-alfred-alfredpreferences-workflows-dir "user.workflow.F9F63749-8D6C-4FD6-968F-B3825A35C5EA"))

(provide '+macos)
;;; +macos.el ends here
