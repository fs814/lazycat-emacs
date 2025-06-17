;;; private/fsdir/+vim.el -*- lexical-binding: t; -*-

(fsdir-filelist "vim-home")

(fsdir-setq "vim-home" "" "d:/vim-home/")
(fsdir-setq "vim-home" "cache" (concat fsdir-vim-home-dir ".cache/"))
(fsdir-setq "vim-home" "cache-github" (concat fsdir-vim-home-cache-dir "vimfiles/repos/github.com/"))
(fsdir-setq "vim-home" "cache-spacevim" (concat fsdir-vim-home-cache-dir "SpaceVim/"))
