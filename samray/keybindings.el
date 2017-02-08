;;; spacemacs/set-leader-keys starts here
(spacemacs/set-leader-keys "o o" 'occur-dwim)
(spacemacs/set-leader-keys "o r" 'query-replace-dwim)
;; set key-binding for switch-to-buffer
(spacemacs/set-leader-keys "b l" 'switch-to-buffer)
(spacemacs/declare-prefix "o" "Personal Usage")
(spacemacs/set-leader-keys "o y" 'youdao-dictionary-search-at-point+)
(spacemacs/set-leader-keys "o d" 'find-by-pinyin-dire)

;;; spacemacs/set-leader-keys ends here


;;; edit-multiedit mode start here
(evilified-state-evilify-map occur-mode-map
  :mode occur-mode)
;; Highlights all matches of the selection in the buffer.
(define-key evil-visual-state-map "R" 'evil-multiedit-match-all)

;; Match the word under cursor (i.e. make it an edit region). Consecutive presses will
;; incrementally add the next unmatched match.
(define-key evil-normal-state-map (kbd "M-d") 'evil-multiedit-match-and-next)
;; Match selected region.
(define-key evil-visual-state-map (kbd "M-d") 'evil-multiedit-match-and-next)

;; Same as M-d but in reverse.
(define-key evil-normal-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)
(define-key evil-visual-state-map (kbd "M-D") 'evil-multiedit-match-and-prev)

;; OPTIONAL: If you prefer to grab symbols rather than words, use
;; `evil-multiedit-match-symbol-and-next` (or prev).

;; Restore the last group of multiedit regions.
(define-key evil-visual-state-map (kbd "C-M-D") 'evil-multiedit-restore)

;; RET will toggle the region under the cursor
(define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; ...and in visual mode, RET will disable all fields outside the selected region
(define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)

;; For moving between edit regions
(define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
(define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)
(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)
(define-key evil-normal-state-map "\C-a" 'evil-beginning-of-line)
(define-key evil-insert-state-map "\C-a" 'beginning-of-line)
(define-key evil-visual-state-map "\C-a" 'evil-beginning-of-line)
(define-key evil-motion-state-map "\C-a" 'evil-beginning-of-line)
;; Ex command that allows you to invoke evil-multiedit with a regular expression, e.g.
(evil-ex-define-cmd "ie[dit]" 'evil-multiedit-ex-match)
;;; edit-multiedit ends here

;;; misc starts here
(with-eval-after-load 'dired-mode
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
(global-set-key "\C-e" 'move-end-of-line)
(with-eval-after-load 'js2-mode
  '(add-hook 'js2-mode-hook
             (lambda ()
               (define-key js2-mode-map (kbd "C-x C-e") 'nodejs-repl-send-last-sexp)
               (define-key js2-mode-map (kbd "C-c C-r") 'nodejs-repl-send-region)
               (define-key js2-mode-map (kbd "C-c C-l") 'nodejs-repl-load-file)
               (define-key js2-mode-map (kbd "C-c C-z") 'nodejs-repl-switch-to-repl)))

  )

;;; misc ends here

