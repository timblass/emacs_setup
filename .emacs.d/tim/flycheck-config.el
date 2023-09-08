(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))


(flycheck-define-checker
    python-mypy ""
    :command ("mypy"
              "--ignore-missing-imports"
              "--python-version" "3.7"
              source-original)
    :error-patterns
    ((error line-start (file-name) ":" line ": error:" (message) line-end))
    :modes python-mode)

(add-to-list 'flycheck-checkers 'python-mypy t)
(flycheck-add-next-checker 'python-pylint 'python-mypy t)

