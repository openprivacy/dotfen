; $Id: .emacs,v 1.61 2007-07-26 16:51:26 fen Exp $
; 2012.12.08 fen updated for emacs 24
; 2009.08.17 fen updated for emacs 23
; 2001.02.08 fen updated for debian
; fen            2/15/93 - created genmagic.el & epoch-xtras.el
; fen           12/23/92 - added epoch code from jg (now emacs-18.59)
; fen            7/13/92 - ported to General Magic on HP-UX (emacs-18.58)
; fen            4/17/91 - ported to Stealth on Sun OS 4.1
; fen           3-Mar-89 - ported to Oracle on Sun OS 4.0
; fen           8-Jun-88 - ported to Aria on A/UX
; fen          14-Sep-86 - ported BSD 4.2
; fen           9-Jul-85 - created at Megatest on BSD 4.1c

;; set my path and add my personal stuff
;;
(add-to-list 'load-path "~/elisp")

(defvar bind-fens-keys t)               ; to get some extra key bindings
(require 'fen)                          ; handy editor functions

;; (require 'php-mode)                  ; PHP mode
(require 'drupal-mode)                  ; Drupal mode
(require 'civicrm-mode
         "drupal-mode.elc")             ; CiviCRM mode

;; set drupal-mode manually
(add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\|inc\\)$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.info" . conf-windows-mode))

(autoload 'geben "geben" "PHP Debugger on Emacs" t)

;; nxml-mode
(if (load "rng-auto" t t)
  (setq auto-mode-alist
          (cons '("\\.\\(xdi\\|xsd\\)\\'" . nxml-mode) auto-mode-alist)))

(autoload 'nxml-mode "nxml-mode" "XML editing mode")
(add-to-list 'auto-mode-alist '("\\.\\(xdi\\|xsd\\)$" . nxml-mode))

;; tell emacs I know what I'm doing
(put 'eval-expression  'disabled nil)    ; convenience for elisp hackers
(put 'narrow-to-region 'disabled nil)
(put 'narrow-to-page   'disabled nil)
(put 'downcase-region  'disabled nil)
(put 'upcase-region    'disabled nil)

;; hooks for personal customization
;;
;(add-hook 'text-mode-hook
;          '(lambda nil (setq fill-column 77) (auto-fill-mode 1)))

(add-hook 'shell-mode-hook
          '(lambda nil (process-kill-without-query
                        (get-buffer-process "*shell*"))
             (setq shell-popd-regexp "popd\\|po"
                   shell-pushd-regexp "pushd\\|pd")))

;; set some variables
;;
(setq-default indent-tabs-mode nil)
(tool-bar-mode 0)
(setq require-final-newline t
      backup-by-copying-when-linked t
      split-height-threshold 20
      scroll-step 2
      inhibit-startup-message t)

;; package management
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (package-initialize)
  )

;; stuff for calendar
;;
(setq calendar-latitude [40 21 north]
      calendar-longitude [80 2 west]
      calendar-location-name "115 Roycroft, Mt. Lebanon")

(if (boundp 'x-display-name)
  (progn
    ;; (set-face-background 'modeline "sandy brown")
    ;; (set-face-foreground 'modeline "black")
    ;; (set-background-color "wheat1")

    ;; (require 'highline)
    ;; (make-face 'my-highline-face)
    ;; (set-face-background 'my-highline-face "lemon chiffon")
    ;; (setq-default highline-face 'my-highline-face)
    ;; (global-highline-mode)

    (setq frame-title-format
          '((buffer-file-name "%f" (dired-directory dired-directory "%b")) " - "
            invocation-name "@" system-name))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(blink-cursor-mode nil)
 '(comment-column 48)
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(custom-safe-themes (quote ("8bb1e9a22e9e9d405ca9bdf20b91301eba12c0b9778413ba7600e48d2d3ad1fb" default)))
 '(fci-rule-color "#383838")
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map (quote ((20 . "#BC8383") (40 . "#CC9393") (60 . "#DFAF8F") (80 . "#D0BF8F") (100 . "#E0CF9F") (120 . "#F0DFAF") (140 . "#5F7F5F") (160 . "#7F9F7F") (180 . "#8FB28F") (200 . "#9FC59F") (220 . "#AFD8AF") (240 . "#BFEBBF") (260 . "#93E0E3") (280 . "#6CA0A3") (300 . "#7CB8BB") (320 . "#8CD0D3") (340 . "#94BFF3") (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))
