;; better defaults
(menu-bar-mode 0)
(global-font-lock-mode t)
(show-paren-mode 1)
(column-number-mode t)

;; the package manager
(require 'package)

(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))

(setq package-list '(elpy flycheck flycheck-flow))

(package-initialize)
;; (setq package-enable-at-startup nil)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
  
;; MOUSE SCROLL (I know this means I'm weak)
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode 1)
  (defun track-mouse (e))
  (setq mouse-sel-mode t)

  (global-set-key [mouse-4] '(lambda ()
                               (interactive)
                               (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                               (interactive)
                               (scroll-up 1))))

;; TEMP FILES - DON'T LITTER MY WORKSPACE!!
(make-directory "~/.emacs.d/autosaves/" t)
(defvar user-temporary-file-directory
  (concat temporary-file-directory user-login-name "/"))
(make-directory user-temporary-file-directory t)
(setq backup-by-copying t)
(setq backup-directory-alist
      `(("." . ,user-temporary-file-directory)
        ))
(setq auto-save-list-file-prefix
      (concat user-temporary-file-directory ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-temporary-file-directory t)))
	  
;; CUSTOM FUNCTIONS
(defun reload-dotemacs ()
  (interactive)
  (load-file "~/.emacs"))
(defun open-dotemacs ()
  (interactive)
  (find-file "~/.emacs"))	  
  
(define-key global-map (kbd "C-c C-e") 'reload-dotemacs)

(setq truncate-partial-width-windows nil)
(setq default-truncate-lines t)  ; i hate wrapping lines
(setq inhibit-startup-message t) ; startup screen is useless
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil) ;;emacs23
(fset 'yes-or-no-p 'y-or-n-p) ; y and n are easier
(setq set-mark-command-repeat-pop 1) ; C-u C-SPC uses mark ring. now C-SPC simply continues.
(setq next-screen-context-lines 5) ; 2 lines isn't enough context on pgdown
(setq scroll-preserve-screen-position t) ; this is a beautiful thing

(setq tab-stop-list (number-sequence 4 120 4))

(load "better-defaults.el")
(load "window-half-scroll.el")
(load "smarter_move_beginning_of_line")
(load "flycheck-config.el")
(load "mac-copy.el")

(load-theme 'wombat
)
