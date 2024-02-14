;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package

(require 'package)
(add-to-list `package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; use-package is built into Emacs since 29
(require 'use-package)
;; (setq use-package-verbose t)
(setq use-package-always-ensure t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; UI

(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)

(setq ring-bell-function 'ignore)

(setq scroll-margin 4
      scroll-conservatively 100000
      scroll-preserve-screen-position t)

(setq inhibit-startup-screen t)

(column-number-mode)
(size-indication-mode)

;; turn on display-line-numers for certain modes
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'tex-mode-hook  'display-line-numbers-mode)

(use-package modus-themes
  :config
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs t)

  ;; Maybe define some palette overrides, such as by using our presets
  (setq modus-themes-common-palette-overrides
        modus-themes-preset-overrides-intense)

  (setq modus-themes-to-toggle '(modus-operandi-tinted modus-vivendi-tinted))
  (define-key global-map (kbd "<f5>") #'modus-themes-toggle)

  ;; Load the theme of your choice.
  (load-theme 'modus-operandi-tinted :no-confirm))

(set-face-attribute 'default nil
                    :family "JetBrains Mono"
                    :height 140)

(use-package doom-modeline
  :init
  (doom-modeline-mode 1))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  Convenience

(use-package ivy
  :init
  (ivy-mode)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))

(use-package counsel
  :init
  (counsel-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Editing

(electric-pair-mode)

;; macOS-like keybindings

(setq mac-command-modifier 'hyper)
(setq mac-option-modifier 'meta)

(global-set-key [(hyper c)] 'kill-ring-save)
(global-set-key [(hyper v)] 'yank)
(global-set-key [(hyper z)] 'undo)
(global-set-key [(hyper s)] 'save-buffer)
(global-set-key [(hyper a)] 'mark-whole-buffer)
(global-set-key [(hyper l)] 'goto-line)
(global-set-key [(hyper w)] (lambda () (interactive) (delete-window)))
(global-set-key [(hyper f)] 'isearch-forward)

(setq make-backup-files nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Git

(use-package magit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Haskell

(use-package haskell-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Agda

(load-file (let ((coding-system-for-read 'utf-8))
             (shell-command-to-string "agda-mode locate")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Customize

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(counsel ivy doom-modeline doom-mode-line haskell-mode magit modus-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
)
