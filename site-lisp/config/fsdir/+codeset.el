;;; private/fsdir/+code.el -*- lexical-binding: t; -*-

;;(setq fsdir-mycode-dir (concat fsdir-sourcecode-dir "myproject/"))

(fsdir-filelist "codeset")
(fsdir-setq "codeset" "aspect" (concat fsdir-myproject-codeset-dir "aspect/"))
(fsdir-setq "codeset" "codebook" (concat fsdir-myproject-codeset-dir "codebook/"))
(fsdir-setq "codeset" "codelib" (concat fsdir-myproject-codeset-dir "codelib/"))
(fsdir-setq "codeset" "codestudylib" (concat fsdir-myproject-codeset-dir "codestudylib/"))
(fsdir-setq "codeset" "coding" (concat fsdir-myproject-codeset-dir "coding/"))
(fsdir-setq "codeset" "demo" (concat fsdir-myproject-codeset-dir "demo/"))
(fsdir-setq "codeset" "HDK" (concat fsdir-myproject-codeset-dir "HDK/"))
(fsdir-setq "codeset" "X11" (concat fsdir-myproject-codeset-dir "X11/"))

(defun fsdir-codeset-keyword ()
  (interactive)
  (setq keyword (ivy-read "keyword: " nil))
  (setq file (ivy-read "keyword: " (directory-files-recursively fsdir-myproject-codeset-dir keyword)))
  (find-file file))


