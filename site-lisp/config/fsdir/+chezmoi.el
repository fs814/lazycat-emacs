
(fsdir-filelist "chezmoi")

(cond (IS-MAC
       (fsdir-setq "chezmoi" "" "/Users/fs814/.local/share/chezmoi/"))
      (IS-LINUX
       (fsdir-setq "chezmoi" "" "/home/shengfeng/.local/share/chezmoi/"))
      (IS-WINDOWS
       (fsdir-setq "chezmoi" "" "C:/Users/shengfeng/.local/share/chezmoi/"))
      )
