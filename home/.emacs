;; William Meng's emacs config
;; Compatible with emacs23

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; marmalade repos
(require 'package)
(add-to-list 'package-archives
			 '("marmalade" .
			   "http://marmalade-repo.org/packages/"))
(package-initialize)

;; vim-like bindings
(require 'evil)
(evil-mode 1)

(setq inhibit-splash-screen t) ; disable splash screen
(global-linum-mode t) ;; enable line numbers

(load-theme 'solarized-light t) ; emacs24
;(color-theme-solarized-light) ; emacs23

;; python-mode
(autoload 'python-mode "python-mode" "Python Mode." t)
 (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
 (add-to-list 'interpreter-mode-alist '("python" . python-mode))

(if (display-graphic-p)
  (progn ;; for graphical mode only
	(tool-bar-mode -1) ;; disable toolbar
	(set-face-attribute 'default nil :height 100) ;; font size 12
	)
  ;; else (optional)
  ;; for terminal mode only
  )
