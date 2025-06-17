;;; private/fsdir/+blender.el -*- lexical-binding: t; -*-

(setq fsdir-blender-dir "")

(when (file-exists-p "C:/Program Files/Blender Foundation/Blender/2.79/scripts/")
  (setq fsdir-blender-dir "C:/Program Files/Blender Foundation/Blender/2.79/"))

(when (file-exists-p "D:/Program Files/Blender Foundation/Blender/2.79/scripts/")
  (setq fsdir-blender-dir "D:/Program Files/Blender Foundation/Blender/2.79/"))

(when (file-exists-p "C:/Users/shengfeng/scoop/apps/blender/2.79b/2.79/")
  (setq fsdir-blender-dir "C:/Users/shengfeng/scoop/apps/blender/2.79b/2.79/"))

(fsdir-filelist "blender")
(fsdir-setq "blender" "script" (concat fsdir-blender-dir "scripts/"))
(fsdir-setq "blender" "python" (concat fsdir-blender-dir "python/"))

