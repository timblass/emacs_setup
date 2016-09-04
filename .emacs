(require 'package)

;; Add melpa package source when using package list
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

;; Load emacs packages and activate them
;; This must come before configurations of installed packages.
;; Don't delete this line.
(package-initialize)

;; so you can see what you've selected
(transient-mark-mode 1)

;; Set the number to the number of columns to use.
(setq-default fill-column 79)

;; Add Autofill mode to mode hooks.
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Show line number in the mode line.
(line-number-mode 1)

;; Show column number in the mode line.
(column-number-mode 1)

;; show the column number!
;;(setq column-number-mode t)

;; delete trailing whiespace after save: C-x C-s
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Don't use TABS for indentations.
(setq-default indent-tabs-mode nil)

;; Enable syntax highlighting. This will also highlight lines that form a region.
(global-font-lock-mode 1)

;; include column marker
(add-to-list 'load-path "~/.emacs.d/packages")
(require 'column-marker)
(add-hook 'sh-mode-hook (lambda () (interactive) (column-marker-1 80))) ;; shell

;;------------------------------------;;
;; Python formatting

;; Indentation is automatically added.
;; When a tab is pressed it is replaced with 4 spaces.
;; When backspace is pressed on an empty line, the cursor will jump to
;; the previous indentation level.
(load-library "python")

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
                    (set-variable 'py-indent-offset 4)
                    (set-variable 'indent-tabs-mode nil))))

;; -- column marker in Red
(set-face-background 'column-marker-1 "red")
(add-hook 'python-mode-hook
          (lambda () (interactive)
            (column-marker-1 fill-column)))

;; Flymake checking for Pep8
;; Setup for Flymake code checking.
(require 'flymake)
(load-library "flymake-cursor")

;; Script that flymake uses to check code. This script must be
;; present in the system path.
(setq pycodechecker "pychecker")

(when (load "flymake" t)
  (defun flymake-pycodecheck-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list pycodechecker (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pycodecheck-init)))

(add-hook 'python-mode-hook 'flymake-mode)

;; fill column indicator
(require 'fill-column-indicator)
(setq-default fci-rule-column 80)
(add-hook 'python-mode-hook 'fci-mode)


;; autocompletion Jedi
;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:complete-on-dot t)                 ; optional
;;------------------------------------;;



;;------------------------------------;;
;; SOLARIZED THEME
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'solarized-dark t)

(set-face-attribute 'default nil :height 140)
;;------------------------------------;;


;; hook for moving backup files (*.*~) to ~/.saves/ directory
(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))    ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups
