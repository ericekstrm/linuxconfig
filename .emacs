
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "e6f3a4a582ffb5de0471c9b640a5f0212ccf258a987ba421ae2659f1eaa39b09" "c4063322b5011829f7fdd7509979b5823e8eea2abf1fe5572ec4b7af1dd78519" default)))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   (quote
    (evil treemacs doom-themes telephone-line ivy use-package))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

; ==================
; ===|  Basics   |==
; ==================

;(setq initial-frame-alist '((top . 10) (left . 1930) (width . 100) (height . 60)))

(menu-bar-mode -1)      ; Disable menubar
(tool-bar-mode -1)      ; Disable toolbar
(scroll-bar-mode -1)    ; Disable visible scrollbar
(horizontal-scroll-bar-mode -1)

;; Set unique names for buffers with the same name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(save-place-mode 1)
(delete-selection-mode 1)

;; Show matching parenthesis when selecting one.
(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq show-paren-delay 0)

(setq mouse-wheel-progressive-speed nil)

;; Use relative line numbers in all files
(global-display-line-numbers-mode)
(setq display-line-numbers 'relative)

;; Make ESC quit prompts
;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Sets font size to 10pt
(set-face-attribute 'default nil :height 90)

;; Breaks line at 90 characters when in text mode 
(add-hook 'text-mode-hook #'auto-fill-mode)
(setq-default fill-column 90)

;; Formats the window title
;(setq frame-title-format '(buffer-file-name "Emacs %b (%f)"))


; ===================
; ====|   C++     |==
; ===================

;; C++ formating
(setq c-default-style "bsd")
(setq indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(c-set-offset 'innamespace 0)
;; c++ mode for .h files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tcc\\'" . c++-mode))

;; awesome keybindings to move between buffers
(global-set-key (kbd "M-j") 'windmove-down)
(global-set-key (kbd "M-k") 'windmove-up)
(global-set-key (kbd "M-h") 'windmove-left)
(global-set-key (kbd "M-l") 'windmove-right)


;; ====================
;; ====| Packages |====
;; ====================

;; Setup to be able to use packages
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa")
                         ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))      ; Need to run this manually if use-package is not working
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; Better autocomplete in minibuffers
(use-package ivy
  :bind (:map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("H-i" . ivy-previous-line)
         ("C-k" . ivy-next-line)
         :map ivy-switch-buffer-map
         ("H-i" . ivy-previous-line)
         ("C-k" . ivy-next-line)))
(ivy-mode 1)

;; Set a cool mode line style
;; https://github.com/dbordak/telephone-line
(use-package telephone-line)
(telephone-line-mode 1)

(use-package doom-themes
  :config
  (load-theme 'doom-gruvbox))
;;         or: doom-oceanic-next

(use-package treemacs
  :config
  (progn
    (setq treemacs-collapse-dirs    2    ; collapses this number of directories if they only contain another directory.
          treemacs-file-event-delay 2000 ; time in miliseconds before updating files
          treemacs-indentation      2    ; indentation levels
          treemacs-width            35   ; width of the treemacs window
          treemacs-silent-refresh   t    ; no log message when refreshing
          treemacs-silent-filewatch t    ; no log message then refreching files
          treemacs-tag-follow-delay 0.2) ; 
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t))
  :bind
  (:map treemacs-mode-map
        ("a" . treemacs-add-project-to-workspace)
        ("d" . treemacs-remove-project-from-workspace)
        ("M-l" . windmove-right)
        ("i" . treemacs-previous-line)
        ("k" . treemacs-next-line)
        ("C-i" . treemacs-previous-line)
        ("C-k" . treemacs-next-line)
        ("l" . treemacs-RET-action)
        ("j" . treemacs-COLLAPSE-action)))
    
(global-set-key [f8] 'treemacs)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))
;; Enable Evil
(require 'evil)
(evil-mode 1)
; https://github.com/emacs-evil/evil-collection ?
