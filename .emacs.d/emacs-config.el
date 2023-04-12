(setq inhibit-startup-screen t) ; Disable startup screen
(menu-bar-mode -1)              ; Disable menubar
(tool-bar-mode -1)              ; Disable toolbar
(scroll-bar-mode -1)            ; Disable visible scrollbar
(horizontal-scroll-bar-mode -1) ; Disable visable scrollbar
(save-place-mode 1)             ; Remember where in the file we were
(delete-selection-mode 1)       ; Delete the selected text when pasting
(winner-mode 1)                 ; Remember window configurations (C-c left an'd C-c right to move between them)
(setq ring-bell-function 'ignore) ; Turn of the fucking sound 
(setq sentence-end-double-space nil)

(setq mouse-wheel-progressive-speed nil)

(show-paren-mode 1)
(setq show-paren-delay 0)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(setq my-name "Eric Ekström")
(setq my-email "ericekstrm@gmail.com")
(setq my-machine-name (system-name))

(set-face-attribute 'default nil :height 90)
(pcase my-machine-name
  ("kit" (set-face-attribute 'default nil :height 130))
  ("kube" (set-face-attribute 'default nil :height 90)))
;; Set initial window size
(setq initial-frame-alist '((width . 110) (height . 60)))

(setq backup-directory-alist `(("." . "~/.emacs.d/backup-files")))
(setq version-control t     ;; Use version numbers for backups.
      kept-new-versions 10  ;; Number of newest versions to keep.
      kept-old-versions 0   ;; Number of oldest versions to keep.
      delete-old-versions t ;; Don't ask to delete excess backup versions.
      backup-by-copying t)  ;; Copy all files, don't rename them
(setq vc-make-backup-files t)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(setq c-default-style "bsd")
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq-default c-basic-offset 4)
(c-set-offset 'innamespace 0)
;; c++ mode for .h and .tcc files
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.tcc\\'" . c++-mode))

(setq org-src-window-setup 'split-window-below)

(setq org-M-RET-may-split-line nil)
(setq org-insert-heading-respect-content t)

(add-hook 'text-mode-hook #'auto-fill-mode)
(setq-default fill-column 90)

(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("org" . "https://orgmode.org/elpa")
			 ("gnu" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))               ; Need to run this manually if use-package is not working
(unless (package-installed-p 'use-package)
  (package-install 'use-package))           ; Install use-package if not installed
(require 'use-package)
(setq use-package-always-ensure t)          ;
(setq use-package-compute-statistics t)     ; Profiler (get report with use-package-report)

(use-package use-package-chords
  :config (key-chord-mode 1)
  :custom (key-chord-two-keys-delay 0.5))

(use-package doom-themes
  :config
  (load-theme 'doom-gruvbox t))

(use-package evil
  :init
  (evil-mode 1)
  :custom
  (evil-want-integration t)
  (evil-want-keybinding nil)
  :chords (:map evil-insert-state-map
                ("jj" . evil-normal-state)))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init '(buff-menu company dired ediff ivy org)))

;; Adds '_' to be part of words in prog-mode
(add-hook 'prog-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
;; Restores tab functionality to normal and visual mode
(define-key evil-normal-state-map (kbd "TAB") 'indent-for-tab-command)
(define-key evil-visual-state-map (kbd "TAB") 'indent-for-tab-command)

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))
(use-package evil-commentary
  :config
  (evil-commentary-mode))

;; Restore redo functionality
(use-package undo-tree
  :after evil
  :diminish     ; hides the mode from list of minor modes
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1)
  (setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo-tree-files"))))

(use-package ivy
  :init
  (ivy-mode 1)
  :bind (:map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("RET" . ivy-alt-done)
         ("C-k" . ivy-previous-line)
         ("C-j" . ivy-next-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-j" . ivy-next-line))
  :custom
  (ivy-use-virtual-buffers t)                                ; add recent files to list of buffers
  (ivy-initial-inputs-alist nil)                             ; remove the '^' as inital char in buffer
  (ivy-re-builders-alist '((t . ivy--regex-ignore-order))))  ; add some flexibility to ivy search

(use-package counsel
  :after ivy
  :config
  (counsel-mode))

(use-package ivy-rich
  :config
  (ivy-rich-set-columns 'ivy-switch-buffer 'nil)   ; remove rich text in switch buffer. TODO: Bug!!
  (ivy-rich-mode 1))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)))

(use-package telephone-line)
(telephone-line-mode 1)

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
        ("l" . treemacs-RET-action)
        ("h" . treemacs-COLLAPSE-action)))
(global-set-key [f8] 'treemacs)

(use-package windmove
  :bind
  ((("M-j" . windmove-down)
    ("M-k" . windmove-up)
    ("M-h" . windmove-left)
    ("M-l" . windmove-right))))
