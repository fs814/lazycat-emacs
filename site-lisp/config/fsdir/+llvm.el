;;; +llvm.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2022 John Doe
;;
;; Author: John Doe <john@doe.com>
;; Maintainer: John Doe <john@doe.com>
;; Created: April 21, 2022
;; Modified: April 21, 2022
;; Version: 0.0.1
;; Keywords: Symbol’s value as variable is void: finder-known-keywords
;; Homepage: https://github.com/fs814/+llvm
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:

(fsdir-filelist "llvm")

(fsdir-setq "llvm" "" (concat fsdir-sourcecode-compiler-llvm-dir "llvm-project/"))

(fsdir-setq "llvm" "bolt" (concat fsdir-llvm-dir "bolt/"))
(fsdir-setq "llvm" "build" (concat fsdir-llvm-dir "build/"))
(fsdir-setq "llvm" "clang" (concat fsdir-llvm-dir "clang/"))
(fsdir-setq "llvm" "clang-tools-extra" (concat fsdir-llvm-dir "clang-tools-extra/"))
(fsdir-setq "llvm" "cmake" (concat fsdir-llvm-dir "cmake/"))
(fsdir-setq "llvm" "compiler-rt" (concat fsdir-llvm-dir "compiler-rt/"))
(fsdir-setq "llvm" "cross-project-tests" (concat fsdir-llvm-dir "cross-project-tests/"))
(fsdir-setq "llvm" "flang" (concat fsdir-llvm-dir "flang/"))
(fsdir-setq "llvm" "libc" (concat fsdir-llvm-dir "libc/"))
(fsdir-setq "llvm" "libclc" (concat fsdir-llvm-dir "libclc/"))
(fsdir-setq "llvm" "libcxx" (concat fsdir-llvm-dir "libcxx/"))
(fsdir-setq "llvm" "libcxxabi" (concat fsdir-llvm-dir "libcxxabi/"))
(fsdir-setq "llvm" "libunwind" (concat fsdir-llvm-dir "libunwind/"))
(fsdir-setq "llvm" "lld" (concat fsdir-llvm-dir "lld/"))
(fsdir-setq "llvm" "lldb" (concat fsdir-llvm-dir "lldb/"))
(fsdir-setq "llvm" "llvm" (concat fsdir-llvm-dir "llvm/"))
(fsdir-setq "llvm" "llvm-libgcc" (concat fsdir-llvm-dir "llvm-libgcc/"))
(fsdir-setq "llvm" "mlir" (concat fsdir-llvm-dir "mlir/"))
(fsdir-setq "llvm" "openmp" (concat fsdir-llvm-dir "openmp/"))
(fsdir-setq "llvm" "polly" (concat fsdir-llvm-dir "polly/"))
(fsdir-setq "llvm" "pstl" (concat fsdir-llvm-dir "pstl/"))
(fsdir-setq "llvm" "runtimes" (concat fsdir-llvm-dir "runtimes/"))
(fsdir-setq "llvm" "test" (concat fsdir-llvm-dir "test/"))
(fsdir-setq "llvm" "third-party" (concat fsdir-llvm-dir "third-party/"))
(fsdir-setq "llvm" "utils" (concat fsdir-llvm-dir "utils/"))

(provide '+llvm)
;;; +llvm.el ends here
