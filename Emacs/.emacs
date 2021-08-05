;;; .emacs --- bootstrap the rest of it

;;; Code:
;;(let ((gc-cons-threshold most-positive-fixnum))

  ;; Set repositories
  (require 'package)
  (setq-default
   load-prefer-newer t
   package-enable-at-startup nil)

  (setq package-user-dir "~/emax/elpa")
  (setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                            ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                            ("melpa-stable" . "https://stable.melpa.org/packages/")
                            ))
  (package-initialize)

  ;; Install dependencies
  (unless (and (package-installed-p 'delight)
               (package-installed-p 'use-package))
    (package-refresh-contents)
    (package-install 'delight t)
    (package-install 'use-package t))
  (setq-default
   use-package-always-defer t
   use-package-always-ensure t)

  ;; Use latest Org
  (use-package org
    ;;:pin org
    :ensure org-plus-contrib)

;; I have totally no idea what these thing do
  ;; (defvar emax-root (concat (expand-file-name "~") "/emax"))
  ;; (defvar emax-bin (concat emax-root "/bin"))
  ;; (defvar emax-bin64 (concat emax-root "/bin64"))
  ;; (defvar emax-lisp (concat emax-root "/lisp"))

  ;; (setq exec-path (cons emax-bin exec-path))
  ;; (setenv "PATH" (concat emax-bin ";" (getenv "PATH")))

  ;; (setq exec-path (cons emax-bin64 exec-path))
  ;; (setenv "PATH" (concat emax-bin64 ";" (getenv "PATH")))

  ;; (setenv "PATH" (concat "C:\\msys64\\usr\\bin;C:\\msys64\\mingw64\\bin;" (getenv "PATH")))

  ;; (dolist (dir '("~/emax/" "~/emax/bin/" "~/emax/bin64/" "~/emax/lisp/" "~/emax/elpa/"))
  ;; (add-to-list 'load-path dir))
;; End no idea. 

  (set-language-environment 'utf-8)
  (setq locale-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)

  ;;; from purcell/emacs.d
  ;;; a custom function
  ;;; I don't think it's good to use it but I leave it here
  (defun require-package (package &optional min-version no-refresh)
      "Install given PACKAGE, optionally requiring MIN-VERSION.
  If NO-REFRESH is non-nil, the available package lists will not be
  re-downloaded in order to locate PACKAGE."
      (if (package-installed-p package min-version)
              t
          (if (or (assoc package package-archive-contents) no-refresh)
                  (package-install package)
              (progn
                  (package-refresh-contents)
                  (require-package package min-version t)))))

  ;; Tangle configuration
  (org-babel-load-file (expand-file-name "~/emacs.org" user-emacs-directory))
  ;;(garbage-collect))

;;; init.el ends here
