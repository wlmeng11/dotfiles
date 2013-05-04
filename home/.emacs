;; marmalade repos
(require 'package)
(add-to-list 'package-archives 
			 '("marmalade" .
			   "http://marmalade-repo.org/packages/"))
(package-initialize)

;; enable vi emulation mode
(require 'evil)
(evil-mode 1)

(global-linum-mode t) ;; enable line numbers

(if (display-graphic-p)
  (progn ;; for graphical mode only
	(load-theme 'solarized-dark t) ;; set color scheme
	(tool-bar-mode -1) ;; disable toolbar
	(set-face-attribute 'default nil :height 120) ;; font size 12
	)
  ;; else (optional)
  ;; for terminal mode only
  )

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(custom-safe-themes (quote ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
  '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  )
