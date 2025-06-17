;;; private/fsdir/+bindings.el -*- lexical-binding: t; -*-

(fsdir-goto-define "settings" fsdir-settings-dir)
(fsdir-goto-define "bin" fsdir-settings-bin-dir)
(fsdir-goto-define "conkeror" fsdir-settings-conkeror-dir)
(fsdir-goto-define "chezmoi" fsdir-chezmoi-dir)
(fsdir-goto-define "markdown" fsdir-markdown-dir)
;;(fsdir-goto-define "stumpwm" fsdir-settings-stumpwm-dir)
(fsdir-goto-define "vim" fsdir-settings-oldvim-dir)
(fsdir-goto-define "zsh" fsdir-settings-zsh-dir)

(fsdir-goto-define "sourcecode" fsdir-sourcecode-dir)
(fsdir-goto-define "editor-emacs" fsdir-sourcecode-editor-emacs-dir)
(fsdir-goto-define "editor-vim" fsdir-sourcecode-editor-vim-dir)
(fsdir-goto-define "gameengine-unrealengine" fsdir-sourcecode-gameengine-unrealengine-dir)
(fsdir-goto-define "sourcecode-linuxwin" fsdir-sourcecode-linuxwin-dir)
(fsdir-goto-define "vimconf-spacevim" fsdir-sourcecode-vimconf-spacevim-dir)

(fsdir-goto-define "doom" fsdir-doom-emacs-dir)
(fsdir-goto-define "doom-modules" fsdir-doom-modules-dir)
(fsdir-goto-define "doom-packages" fsdir-doom-packages-dir)
(fsdir-goto-define "doom-private" fsdir-doom-private-dir)
(fsdir-goto-define "sourcecode-mobileorg" fsdir-sourcecode-mobileorg-dir)

(fsdir-goto-define "myproject-art" fsdir-myproject-art-dir)
(fsdir-goto-define "myproject-codeset" fsdir-myproject-codeset-dir)
(fsdir-goto-define "myproject-monorepo" fsdir-myproject-monorepo-dir)
(fsdir-goto-define "myproject-rabmono" fsdir-myproject-rabmono-dir)
(fsdir-goto-define "myproject-rabengine" fsdir-myproject-rabengine-dir)

(lazy-load-global-keys
'(
  ("\C-xGa" . +fsdir/goto-myproject-art-dir)
 ("\C-xGb" . +fsdir/goto-bin-dir)
 ("\C-xGc" . +fsdir/goto-conkeror-dir)
 ("\C-xGC" . +fsdir/goto-chezmoi-dir)
 ("\C-xGd" . +fsdir/goto-doom-dir)
 ("\C-xGD" . +fsdir/goto-docker-dir)
 ("\C-xGe" . +fsdir/goto-editor-emacs-dir)
 ("\C-xGm" . +fsdir/goto-sourcecode-mobileorg-dir)
 ("\C-xGM" . +fsdir/goto-myproject-monorepo-dir)
 ("\C-xGp" . +fsdir/goto-doom-private-dir)
 ("\C-xGP" . +fsdir/goto-doom-packages-dir)
 ("\C-xGr" . +fsdir/goto-myproject-rabmono-dir)
 ("\C-xGR" . +fsdir/goto-myproject-rabengine-dir)
 ("\C-xGss" . +fsdir/goto-sourcecode-dir)
 ("\C-xGsS" . +fsdir/goto-sourcenew-dir)
 ("\C-xGS" . +fsdir/goto-settings-dir)
 ("\C-xGu" . +fsdir/goto-gameengine-unrealengine-dir)
 ("\C-xGv" . +fsdir/goto-editor-vim-dir)
 ("\C-xGV" . +fsdir/goto-vimconf-spacevim-dir)
 ("\C-xGz" . +fsdir/goto-zsh-dir)
)
"open-directory")

(map!
 "C-x O a" #'+fsdir/open-arttools-dir
 "C-x O b" #'+fsdir/open-blender-dir
 "C-x O B" #'+fsdir/open-buildtools-dir
 "C-x O c" #'+fsdir/open-crack-dir
 "C-x O C" #'+fsdir/open-chezmoi-dir
 ;;"C-x O C" #'+fsdir/open-config-dir
 "C-x O d" #'+fsdir/open-doom-dir
 "C-x O D" #'+fsdir/open-download-dir
 "C-x O E" #'+fsdir/open-emacs-dir
 "C-x O L" #'+fsdir/open-llvm-dir
 "C-x O m" #'+fsdir/open-myproject-dir
 "C-x O M" #'+fsdir/open-macos-dir
 "C-x O n" #'+fsdir/open-nextcloud-dir
 "C-x O N" #'+fsdir/open-neovim-dir
 "C-x O p" #'+fsdir/open-powershell-dir
 "C-x O r" #'+fsdir/open-rocom-dir
 "C-x O s" #'+fsdir/open-settings-dir
 "C-x O S" #'+fsdir/open-sourcecode-dir
 "C-x O t" #'+fsdir/open-ta-dir
 "C-x O v" #'+fsdir/open-vim-home-dir
 "C-x O w" #'+fsdir/open-wox-dir
 ;;"C-x O u" #'+fsdir/open-workunity-dir
 "C-x O U" #'+fsdir/open-unrealengine-dir

 "\C-xGa" #'+fsdir/goto-myproject-art-dir
 "\C-xGb" #'+fsdir/goto-bin-dir
 "\C-xGc" #'+fsdir/goto-conkeror-dir
 "\C-xGC" #'+fsdir/goto-chezmoi-dir
 "\C-xGd" #'+fsdir/goto-doom-dir
 "\C-xGD" #'+fsdir/goto-docker-dir
 "\C-xGe" #'+fsdir/goto-editor-emacs-dir
 "\C-xGm" #'+fsdir/goto-sourcecode-mobileorg-dir
 "\C-xGM" #'+fsdir/goto-myproject-monorepo-dir
 "\C-xGp" #'+fsdir/goto-doom-private-dir
 "\C-xGP" #'+fsdir/goto-doom-packages-dir
 "\C-xGr" #'+fsdir/goto-myproject-rabmono-dir
 "\C-xGR" #'+fsdir/goto-myproject-rabengine-dir
 "\C-xGss" #'+fsdir/goto-sourcecode-dir
 "\C-xGsS" #'+fsdir/goto-sourcenew-dir
 "\C-xGS" #'+fsdir/goto-settings-dir
 "\C-xGu" #'+fsdir/goto-gameengine-unrealengine-dir
 "\C-xGv" #'+fsdir/goto-editor-vim-dir
 "\C-xGV" #'+fsdir/goto-vimconf-spacevim-dir
 ;;"\C-xGw" #'+fsdir/goto-stumpwm-dir
 "\C-xGz" #'+fsdir/goto-zsh-dir
 "<f1>c"  #'fsdir-cheatsheet-keyword)
