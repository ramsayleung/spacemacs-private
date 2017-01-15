;;; packages.el --- samray layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Samray <samray@localhost.localdomain>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `samray-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `samray/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `samray/pre-init-PACKAGE' and/or
;;   `samray/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst samray-packages
  '(evil-multiedit
    dired+
    paredit
    slime
    ac-js2
    virtualenvwrapper
    nodejs-repl
    ;; (ac-html-csswatcher :location (
    ;;                                recipe
    ;;                                :fetcher github
    ;;                                :repo "osv/ac-html-csswater"))
    vue-mode
    ;; (vue-mode :location (recipe
    ;;                      :fetcher github
    ;;                      :repo "codefalling/vue-mode"))
    ;; (hl-tags-mode :location (recipe
    ;;                          :fetcher github
    ;;                          :repo "deactivated/hl-tags-mode"))
    ;; (livedown :location (recipe
    ;;                      :fetcher github
    ;;                      :repo "shime/emacs-livedown"))
    )
  "The list of Lisp packages required by the samray layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun samray/init-evil-multiedit ()
  (use-package evil-multiedit
    :init ())
  )
(defun samray/init-dired+ ()
  (use-package dired+
    :init
    (diredp-toggle-find-file-reuse-dir t)))
(defun samray/init-vue-mode()
  (use-package vue-mode
    :init
    ()))

(defun samray/init-paredit()
  (use-package paredit
    :init
    ()))
;; (defun samray/init-ac-html-csswatcher ()
;;   (use-package ac-html-csswatcher
;;     :init
;;     ()))
(defun samray/init-slime ()
  (use-package slime
    :init
    ()))
(defun samray/init-virtualenvwrapper ()
    (use-package virtualenvwrapper
      :init
      :config
      ()))
(defun samray/init-ac-js2 ()
  (use-package ac-js2
    :init
    :config
    (add-hook 'js2-mode-hook 'ac-js2-mode)))
(defun samray/init-nodejs-repl ()
  (use-package nodejs-repl
    :init
    :config
    ()))
;; (defun samray/post-init-ac-html-csswatcher ()
;;   (add-hook 'web-mode 'ac-html-csswatcher+)
;;   (add-hook 'html-mode 'ac-html-csswatcher+)
;;   )
;;; packages.el ends here
