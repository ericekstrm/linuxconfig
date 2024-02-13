;;; doom-1337-theme.el --- ported from VSCode's 1337 theme -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: May 22, 2021 (#545)
;;
;;; Commentary:
;;; Code:

;; Function to reload theme with <f1>
;; (defun m ()
;;   (interactive)
;;   (save-buffer)
;;   (load-theme 'my t))
;; (keymap-global-set "<f1>" 'm)



(require 'doom-themes)

(def-doom-theme my
  "A theme  "

  ((bg     '("#1F1F1F"))
   (bg-alt '("#151515"))
   (fg     '("#EEEEEE"))
   (fg-alt '("#989898"))

   (base0      '("#1B2229" "black"       "black"       ))
   (base1      '("#1c1f24" "#1e1e1e"     "brightblack" ))
   (base2      '("#202328" "#2e2e2e"     "brightblack" ))
   (base3      '("#23272e" "#262626"     "brightblack" ))
   (base4      '("#3f444a" "#3f3f3f"     "brightblack" ))
   (base5      '("#5B6268" "#525252"     "brightblack" ))
   (base6      '("#73797e" "#6b6b6b"     "brightblack" ))
   (base7      '("#9ca0a4" "#979797"     "brightblack" ))
   (base8      '("#DFDFDF" "#dfdfdf"     "white"       ))

   (grey      base4)
   (green     '("#98BE65"))
   (red       '("#FF6C6B"))
   (blue      '("#51AFEF"))
   (dark-blue '("#2257A0"))
   (magenta   '("#C678DD"))
   (orange    '("#DA8548"))
   (yellow    '("#ECBE7B"))
   (cyan      '("#46D9FF"))
   (teal    cyan)
   (dark-cyan cyan)
   (violet    magenta)


   (region (doom-blend (doom-lighten bg 0.1) blue 0.9))
   (highlight blue)
   (vertical-bar bg)
   
   (functions blue)
   (keywords red)
   (builtin red)
   (comments base5)
   (doc-comments base5)
   (type magenta)
   (strings green)
   (variables cyan)
   (numbers (doom-lighten blue 0.5))
   (constants magenta)

   (error   red)
   (warning yellow)
   (success green)

   (operators fg)  ;; Preprocessor directives in c++
   (methods fg)
   (selection fg)

   (vc-modified (doom-darken cyan  0.15))
   (vc-deleted  (doom-darken green 0.15))
   (vc-added    (doom-darken red   0.05))
   )

  ;;  ;; custom categories
  ;;  (hidden     `(,(car bg) "black" "black"))
  ;;  (-modeline-bright doom-oceanic-next-brighter-modeline)

  ;;  (modeline-fg     nil)
  ;;  (modeline-fg-alt base5)

  ;;  (modeline-bg
  ;;   (doom-darken blue 0.45))
  ;;  (modeline-bg-inactive  (doom-darken bg-alt 0.1))
  ;;  )

  (

  ;; ;;;; Base theme face overrides
  ;;  ((line-number &override) :foreground base4)
  ;;  ((line-number-current-line &override) :foreground fg)
  ;;  ((font-lock-comment-face &override)
  ;;   :background (if doom-oceanic-next-comment-bg (doom-lighten bg 0.05)))

   (mode-line
    :background base3
    :foreground fg)
   (mode-line-inactive
    :background bg-alt
    :foreground fg-alt)
   (telephone-line-accent-active
    :foreground fg
    :background base4)
   (telephone-line-accent-inactive
    :foreground fg-alt
    :background base2)

   ;; directory color match between ivy and dired
   (dired-directory  :foreground green)
   (ivy-subdir :foreground green)

   (org-block-background
    :background base1)
   (org-block
    :background base2)
   (org-level-3
    :foreground green)

   ;; ;;;; ivy
   ;; (ivy-current-match
   ;;  :background base2
   ;;  :distant-foreground base0
   ;;  :weight 'bold)
   ;; (ivy-minibuffer-match-face-2
   ;;  :background bg
   ;;  :weight 'bold
   ;;  :foreground green)
   ;; (telephone-line-accent-active
   ;;  :background base2
   ;;  :foreground base7)
   ;; (telephone-line-accent-inactive
   ;;  :background modeline-bg-inactive
   ;;  :foreground base7)
   )
  ()
  )
