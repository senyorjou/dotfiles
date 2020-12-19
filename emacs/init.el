(setq user-full-name "Marc Jou"
      user-mail-address "smyslov@gmail.com")

(require 'package)

;; Internet repositories for new packages.
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.org/packages/")))

;; Actually get “package” to work.
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; better-defaults - https://melpa.org/#/better-defaults
(use-package better-defaults :defer t :ensure t)

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;; (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(load-theme 'doom-one-light t)

;; helm - https://emacs-helm.github.io/helm/
(use-package helm
  :ensure t
  :init
  (require 'helm-config)
  :config
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (global-set-key (kbd "C-x , b") #'helm-buffers-list)
  (global-set-key (kbd "<backtab>") #'helm-buffers-list)
  (helm-mode 1))

;; projectile - https://docs.projectile.mx/projectile/index.html
(use-package projectile
  :ensure t
  :config
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode +1))

;; https://github.com/bbatsov/helm-projectile
(use-package helm-projectile
  :ensure t
  :config
  (helm-projectile-on))

;; https://github.com/emacsorphanage/helm-ag
(use-package helm-ag
  :ensure t)

;; https://github.com/justbur/emacs-which-key
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

;; https://github.com/Fuco1/smartparens
(use-package smartparens
  :ensure t
  :init
  (smartparens-global-mode))

;; https://github.com/joshwnj/json-mode
(use-package json-mode
  :ensure t)

;; https://github.com/yoshiki/yaml-mode
(use-package yaml-mode
  :ensure t
  :mode (("\\.yml$" . yaml-mode)
        ("\\.yaml$" . yaml-mode)))

;; https://jblevins.org/projects/markdown-mode/
(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

;; https://github.com/domtronn/all-the-icons.el
(use-package all-the-icons
  :ensure t)

;; https://github.com/Alexander-Miller/treemacs
(use-package treemacs
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)  

;; PYHTON
;; pyenv
;;(use-package pyenv
;;  :straight (:host github :repo "aiguofer/pyenv.el")
;;  :config
;;  (global-pyenv-mode))

;; elpy
(use-package elpy
  :ensure t
  :defer t
  :init
  (elpy-enable))

;; CLOJURE
(use-package clojure-mode
  :ensure t
  :init
  (defconst clojure--prettify-symbols-alist
    '(("fn"   . ?λ)
      ("__"   . ?⁈)))

  :config
  (add-hook 'clojure-mode-hook 'global-prettify-symbols-mode)
  :bind (("C-c d f" . cider-code)
         ("C-c d g" . cider-grimoire)
         ("C-c d w" . cider-grimoire-web)
         ("C-c d c" . clojure-cheatsheet)
         ("C-c d d" . dash-at-point)))

(use-package color-identifiers-mode
  :ensure t
  :init
  (add-hook 'clojure-mode-hook 'color-identifiers-mode))

;;(use-package paredit
;;  :ensure t
;;  :init
;;  (add-hook 'clojure-mode-hook 'paredit-mode))

(use-package cider
  :ensure t
  :commands (cider cider-connect cider-jack-in)

  :init
  (setq cider-auto-select-error-buffer t
        cider-repl-pop-to-buffer-on-connect nil
        cider-repl-use-clojure-font-lock t
        cider-repl-wrap-history t
        cider-repl-history-size 1000
        cider-show-error-buffer t
        nrepl-hide-special-buffers t
        ;; Stop error buffer from popping up while working in buffers other than the REPL:
        nrepl-popup-stacktraces nil)

  ;; (add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
  (add-hook 'cider-mode-hook 'company-mode)

  (add-hook 'cider-repl-mode-hook 'paredit-mode)
  (add-hook 'cider-repl-mode-hook 'superword-mode)
  (add-hook 'cider-repl-mode-hook 'company-mode)
  (add-hook 'cider-test-report-mode 'jcf-soft-wrap)

  :bind (:map cider-mode-map
         ("C-c C-v C-c" . cider-send-and-evaluate-sexp)
         ("C-c C-p"     . cider-eval-print-last-sexp))

  ;;:config
  ;;(use-package slamhound)
  )

;; miscellania
(set-language-environment "UTF-8")

(set-default-coding-systems 'utf-8)

(set-face-attribute 'default nil
                    :family "Essential PragmataPro"
                    :height 143
                    :slant 'normal
                    :weight 'normal
                    :width 'normal)

(global-set-key (kbd "C-\\") 'comment-or-uncomment-region) ; easy binding for commenting

(when (window-system)
  (scroll-bar-mode -1))
;;(scroll-bar-mode 0)              ;; no scroll bar
;;(tool-bar-mode 0)                ;; no tool bar
;;(menu-bar-mode 0)                ;; no menu bar
(show-paren-mode 1)                ;; visualize matching parenthesees
(global-hl-line-mode 1)            ;; highlight current line
(global-linum-mode t)              ;; Enable line numbers globally
(setq linum-format "%4d \u2591 ")  ;; and give some air
(set-cursor-color "LightSalmon") 

(eldoc-mode 1) ; enable docs in minibuffer
;; (setq inhibit-startup-screen 1) ; no start screen

;; store all backups in a single directory 
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; y or n instead of yes-or no
(fset 'yes-or-no-p 'y-or-n-p)

;; follow sym-links
(setq vc-follow-symlinks t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(custom-safe-themes
   (quote
    ("79278310dd6cacf2d2f491063c4ab8b129fee2a498e4c25912ddaa6c3c5b621e" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" "4a8d4375d90a7051115db94ed40e9abb2c0766e80e228ecad60e06b3b397acab" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" default)))
 '(fci-rule-color "#5B6268")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(package-selected-packages (quote (helm-rg helm-ag use-package)))
 '(pdf-view-midnight-colors (cons "#bbc2cf" "#282c34"))
 '(rustic-ansi-faces
   ["#282c34" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#bbc2cf"])
 '(vc-annotate-background "#282c34")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#cf6162")
    (cons 300 "#9f585a")
    (cons 320 "#6f4e52")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
