;;; +workunreal.el --- description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2020 John Doe
;;
;; Author: John Doe <http://github/shengfeng>
;; Maintainer: John Doe <john@doe.com>
;; Created: July 20, 2020
;; Modified: July 20, 2020
;; Version: 0.0.1
;; Keywords:
;; Homepage: https://github.com/shengfeng/+workunreal
;; Package-Requires: ((emacs 28.0.50) (cl-lib "0.5"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  description
;;
;;; Code:

(fsdir-filelist "unrealengine")
(fsdir-setq "unrealengine" "" (concat fsdir-base-dir "sourcecode/gameengine/unrealengine-fswork/"))
(fsdir-setq "unrealengine" "engine" (concat fsdir-unrealengine-dir "Engine/"))
(fsdir-setq "unrealengine" "samples" (concat fsdir-unrealengine-dir "Samples/"))
(fsdir-setq "unrealengine" "templates" (concat fsdir-unrealengine-dir "Templates/"))

(fsdir-setq "unrealengine" "engine-binaries" (concat fsdir-unrealengine-engine-dir "Binaries/"))
(fsdir-setq "unrealengine" "engine-binaries-dotnet" (concat fsdir-unrealengine-engine-binaries-dir "DotNET/"))
(fsdir-setq "unrealengine" "engine-binaries-win64" (concat fsdir-unrealengine-engine-binaries-dir "Win64/"))
(fsdir-setq "unrealengine" "engine-binaries-win32" (concat fsdir-unrealengine-engine-binaries-dir "Win32/"))
(fsdir-setq "unrealengine" "engine-binaries-mac" (concat fsdir-unrealengine-engine-binaries-dir "Mac/"))
(fsdir-setq "unrealengine" "engine-binaries-linux" (concat fsdir-unrealengine-engine-binaries-dir "Linux/"))
(fsdir-setq "unrealengine" "engine-binaries-thirdparty" (concat fsdir-unrealengine-engine-binaries-dir "thirdparty/"))

(fsdir-setq "unrealengine" "engine-build" (concat fsdir-unrealengine-engine-dir "Build/"))
(fsdir-setq "unrealengine" "engine-config" (concat fsdir-unrealengine-engine-dir "Config/"))
(fsdir-setq "unrealengine" "engine-document" (concat fsdir-unrealengine-engine-dir "Document/"))
(fsdir-setq "unrealengine" "engine-extras" (concat fsdir-unrealengine-engine-dir "Extras/"))
(fsdir-setq "unrealengine" "engine-plugins" (concat fsdir-unrealengine-engine-dir "Build/"))
(fsdir-setq "unrealengine" "engine-programs" (concat fsdir-unrealengine-engine-dir "Programs/"))
(fsdir-setq "unrealengine" "engine-shaders" (concat fsdir-unrealengine-engine-dir "Shaders/"))
(fsdir-setq "unrealengine" "engine-source" (concat fsdir-unrealengine-engine-dir "Source/"))

(fsdir-filelist "workunreal")
(fsdir-setq "workunreal" "puppeteer" (concat fsdir-sourcecode-work-dir "puppeteer/"))
(fsdir-setq "workunreal" "ue4demo" (concat fsdir-sourcecode-work-dir "UE4Demo/"))

