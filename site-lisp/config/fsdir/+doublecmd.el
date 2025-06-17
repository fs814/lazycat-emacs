;;; +doublecmd.el --- description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 John Doe
;;
;; Author: John Doe <http://github/shengfeng>
;; Maintainer: John Doe <john@doe.com>
;; Created: August 03, 2020
;; Modified: August 03, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/shengfeng/+doublecmd
;; Package-Requires: ((emacs 28.0.50) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  description
;;
;;; Code:

(cond
 (IS-WINDOWS
  (setq doublecmd-cmd "\"C:/Program Files/Double Commander/doublecmd.exe\"")
  )
 (IS-MAC
  (setq doublecmd-cmd "\"/Applications/Double Commander.app/Contents/MacOS/doublecmd\"")
  )
 )

(defun fsdoublecmd-open ()
  (interactive)
  (setq _fsdoublecmd--dir-type (ivy-completing-read "dir type:" fsdir-filelist-type))
  (setq _fsdoublecmd--dir-list (mapcar 'cdr (eval (intern (format "fsdir-%s-filelist" _fsdoublecmd--dir-type)))))
  (setq _fsdoublecmd--dir (directory-file-name (car _fsdoublecmd--dir-list)))
  (setq _fsdoublecmd--dir-list (cdr _fsdoublecmd--dir-list))

  (setq _fsdoublecmd--cmd (concat doublecmd-cmd " \"" _fsdoublecmd--dir "\""))
  (async-shell-command-no-window _fsdoublecmd--cmd)
  (sit-for 2)
  (dolist (_fsdoublecmd--dir _fsdoublecmd--dir-list)
    (setq _fsdoublecmd--cmd (concat doublecmd-cmd " --no-splash -T -C \"" (directory-file-name _fsdoublecmd--dir) "\"" ))
    (async-shell-command-no-window _fsdoublecmd--cmd)
    )
  )

(defun fsdoublecmd-open-directory ()
  (interactive)
  (setq _fsdoublecmd--dir-type (ivy-completing-read "dir type:" fsdir-filelist-type))
  (setq _fsdoublecmd--dir-list (mapcar 'cdr (eval (intern (format "fsdir-%s-filelist" _fsdoublecmd--dir-type)))))
  (setq _fsdoublecmd--dir (directory-file-name (ivy-completing-read "directory:" _fsdoublecmd--dir-list)))
  (async-shell-command-no-window (concat doublecmd-cmd " -T -C \"" (directory-file-name _fsdoublecmd--dir) "\""))
  )

(provide '+doublecmd)
;;; +doublecmd.el ends here
