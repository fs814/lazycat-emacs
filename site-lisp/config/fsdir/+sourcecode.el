;;; private/fsdir/+sourcecode.el -*- lexical-binding: t; -*-

(fsdir-filelist "sourcecode")
(fsdir-setq "sourcecode" "" (concat fsdir-base-dir "sourcecode/"))
(fsdir-setq "sourcecode" "buildsystem" (concat fsdir-sourcecode-dir "buildsystem/"))
(fsdir-setq "sourcecode" "buildsystem-emake" (concat fsdir-sourcecode-buildsystem-dir "emake/"))
(fsdir-setq "sourcecode" "cheat" (concat fsdir-sourcecode-dir "cheat/"))
(fsdir-setq "sourcecode" "cheat-cheatsheets" (concat fsdir-sourcecode-cheat-dir "cheatsheets/"))
(fsdir-setq "sourcecode" "cheat-awesome-cheatsheets" (concat fsdir-sourcecode-cheat-dir "awesome-cheatsheets/"))
(fsdir-setq "sourcecode" "codeset" (concat fsdir-sourcecode-dir "CodeSet/"))
(fsdir-setq "sourcecode" "compiler" (concat fsdir-sourcecode-dir "compiler/"))
(fsdir-setq "sourcecode" "compiler-llvm" (concat fsdir-sourcecode-compiler-dir "llvm/"))

(fsdir-setq "sourcecode" "editor-emacs" (concat fsdir-sourcecode-dir "editor/emacs/"))
(fsdir-setq "sourcecode" "editor-emacs-fswork" (concat fsdir-sourcecode-dir "editor/emacs-fswork/"))
(fsdir-setq "sourcecode" "editor-emacs-modules" (concat fsdir-sourcecode-dir "editor/emacs/modules/"))
(fsdir-setq "sourcecode" "editor-neovim" (concat fsdir-sourcecode-dir "editor/neovim/"))
(fsdir-setq "sourcecode" "editor-vim" (concat fsdir-sourcecode-dir "editor/vim/"))
(fsdir-setq "sourcecode" "editor-vscode" (concat fsdir-sourcecode-dir "editor/vscode/"))
(fsdir-setq "sourcecode" "emacsmodule" (concat fsdir-sourcecode-dir "emacsmodule/"))
(fsdir-setq "sourcecode" "emacsplugin" (concat fsdir-sourcecode-dir "emacsplugin/"))
(fsdir-setq "sourcecode" "emacsplugin-lazycat-eaf" (concat fsdir-sourcecode-dir "emacsplugin/lazycat/emacs-application-framework/"))
(fsdir-setq "sourcecode" "github" (concat fsdir-sourcecode-dir "github/"))
(fsdir-setq "sourcecode" "linuxwin" "/mnt/d/sourcecode/")
(fsdir-setq "sourcecode" "mobileorg" (concat fsdir-sourcecode-dir "mobileorg/"))
(fsdir-setq "sourcecode" "gameengine-unrealengine" (concat fsdir-sourcecode-dir "gameengine/UnrealEngine/"))
(fsdir-setq "sourcecode" "gameengine-unrealengine-fswork" (concat fsdir-sourcecode-dir "gameengine/UnrealEngine-fswork/"))
(fsdir-setq "sourcecode" "orgmode-org" (concat fsdir-sourcecode-dir "orgmode/org/"))
(fsdir-setq "sourcecode" "orgmode-org-contrib-lisp" (concat fsdir-sourcecode-orgmode-org-dir "contrib/lisp/"))
(fsdir-setq "sourcecode" "temp" (concat fsdir-sourcecode-dir "temp/"))
(fsdir-setq "sourcecode" "vimconf-spacevim" (concat fsdir-sourcecode-dir "vimconf/spacevim/"))
(fsdir-setq "sourcecode" "work" (concat fsdir-sourcecode-dir "work/"))
(fsdir-setq "sourcecode" "youtube" (concat fsdir-sourcecode-dir "youtube/"))
(fsdir-setq "sourcecode" "cmakeproj" (concat fsdir-sourcecode-dir "cmakeproj/"))
(fsdir-setq "sourcecode" "xmakeproj" (concat fsdir-sourcecode-dir "xmakeproj/"))
(fsdir-setq "sourcecode" "cuda" "C:/ProgramData/NVIDIA Corporation/CUDA Samples/v10.2/")

(fsdir-setq "sourcecode" "mygitlab" (concat fsdir-sourcecode-dir "mygitlab/"))
(fsdir-setq "sourcecode" "mygitlab-ue4_proj" (concat fsdir-sourcecode-mygitlab-dir "ue4_proj/"))

(fsdir-setq "sourcecode" "ra" (concat fsdir-sourcecode-dir "ra/"))
(fsdir-setq "sourcecode" "ra-morefunue4" (concat fsdir-sourcecode-ra-dir "MorefunUE4/"))
(fsdir-setq "sourcecode" "ra-ra_nb" (concat fsdir-sourcecode-ra-dir "RA_NB/"))

;;(fsdir-filelist "sourcecode" "sourcenew" (concat ))
(fsdir-filelist "sourcenew")
(fsdir-setq "sourcenew" "" (cond
                           (IS-WINDOWS
                            "d:/sourcenew/")
                           (IS-MAC
                            "/Users/fs814/sourcenew/")
                           )
      )

(fsdir-setq "sourcenew" "gameengine" (concat fsdir-sourcenew-dir "gameengine/"))
(fsdir-setq "sourcenew" "gameengine-unrealengine" (concat fsdir-sourcenew-gameengine-dir "unrealengine/"))

(fsdir-filelist "sourcenocase")
(fsdir-setq "sourcenocase" "" (cond
                               (IS-WINDOWS
                                "d:/sourcenocase/"
                                )
                               (IS-MAC
                                "/Users/fs814/sourcenocase/")
                               ))
