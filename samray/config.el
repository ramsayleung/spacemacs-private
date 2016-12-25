;; (require 'recentf);;something
;; (recentf-mode 1)
;; (setq recentf-max-menu-items 25)
;; (delete-selection-mode t)
;; open init file quickly by binding key
;; (defun open-my-file()
;;   (interactive)
;;   (find-file "~/.emacs.d/init.el"))

;; delete spaces at once
;;(global-hungry-delete-mode t)
;; (add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;; require module
(require 'dired-x)


;;; misc module
(abbrev-mode t)
(setq dired-dwim-target t)
;;; set an html convert for markdown 
(custom-set-variables
 '(markdown-command "/usr/bin/pandoc"))
(fset 'yes-or-no-p 'y-or-n-p)
;;; clear insert-state key-binding,makes emacs keybinding work
;;; in evil insert-state
(setq evil-insert-state-map (make-sparse-keymap))
(define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)

(setq dired-recursive-copies 'alway)
(setq dired-recursive-deletes 'alway)
(set-language-environment "UTF-8")
(put 'dired-find-alternate-file 'disabled nil)
(define-abbrev-table 'global-abbrev-table '(
                                            ;; signature
                                            ("8sa" "samray")
                                            ))

;; enable hippie-mode to enhance auto-completion
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol
                                         ))


;;; customize-function
;; auto indent file before save file
(defun indent-buffer()
  (interactive)
  (indent-region (point-min)(point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region"))
      (progn
        (indent-buffer)
        (message "Indented buffer")))))



;;; add-hook module
(add-hook 'before-save-hook 'indent-region-or-buffer)
;; Automaticallly format before saving a file(css js html json file)
(eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
;; Or if you're using 'js-mode' (a.k.a 'javascript-mode')
(eval-after-load 'js
  '(add-hook 'js-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
(eval-after-load 'json-mode
  '(add-hook 'json-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-js-buffer t t))))
(eval-after-load 'sgml-mode
  '(add-hook 'html-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))
(eval-after-load 'web-mode
  '(add-hook 'web-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-html-buffer t t))))
(eval-after-load 'css-mode
  '(add-hook 'css-mode-hook
             (lambda ()
               (add-hook 'before-save-hook 'web-beautify-css-buffer t t))))
;; smartparens-mode will be disable after save for unknown reason in html-mode
;;so i have to manual enable it after save
(eval-after-load 'web-mode
  '(add-hook 'web-mode-hook
             (lambda ()
               (add-hook 'after-save-hook 'smartparens-mode))))



;;(define-advice show-paren-function (:around (fn) fix-show-paren-function)
;;  "Highlight enclosing parens."
;;  (cond ((looking-at-p "\\s(") (funcall fn))
;;       (t (save-excursion
;;          (ignore-errors (backward-up-list))
;;        (funcall fn)))))
;; remove windows end of line identiter
(defun remove-dos-eol ()
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t)(replace-match "")))


;; dwim=do what i mean

(defun occur-dwim()
  "Call `occur` with a sane default"
  (interactive)
  (push (if (region-active-p)
            (buffer-substring-no-properties
             (region-beginning)
             (region-end))
          (let ((sym (thing-at-point 'symbol)))
            (when (stringp sym)
              (regexp-quote sym))))
        regexp-history)
  (call-interactively 'occur))


;;; highlight parent 
(defadvice show-paren-function (around fix-show-paren-function activate)
  (cond ((looking-at-p "\\s(") ad-do-it)
        (t (save-excursion
             (ignore-errors (backward-up-list))
             ad-do-it)))
  )

;; show single quote "'" in emacs and lisp-interaction-mode instead of single
;;; quote pair "''"
;;(sp-local-pair '(emacs-lisp-mode lisp-interaction-mode) "'" nil :actions nil)
