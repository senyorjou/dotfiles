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
(global-set-key (kbd "C-x l") 'bookmark-bmenu-list)

(when (window-system)
  (scroll-bar-mode -1))            ;; no scroll bar
;;(tool-bar-mode 0)                ;; no tool bar
;;(menu-bar-mode 0)                ;; no menu bar
(show-paren-mode 1)                ;; visualize matching parenthesees
(global-hl-line-mode 1)            ;; highlight current line
(global-display-line-numbers-mode t)
;;(setq linum-format "%4d \u2591 ")  ;; and give some air
(set-cursor-color "LightSalmon") 
(setq x-select-enable-clipboard t)

;; better-defaults - https://melpa.org/#/better-defaults
(use-package better-defaults :defer t :ensure t)

;; make shell ENV vars available
(use-package exec-path-from-shell :ensure t)
(exec-path-from-shell-initialize)

(use-package ace-window
  :ensure t
  :defer t
  :bind ("C-x o" . ace-window))

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
  :init (helm-mode t)
  :bind (("M-x"     . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x b"   . helm-mini)     ;; See buffers & recent files; more useful.
	 ("C-x r b" . helm-filtered-bookmarks)
	 ("C-x C-r" . helm-recentf)  ;; Search for recently edited files
	 ("C-c i"   . helm-imenu)
	 ("C-h a"   . helm-apropos)
	 ;; Look at what was cut recently & paste it in.
	 ("M-y" . helm-show-kill-ring)

	 :map helm-map
	 ;; We can list ‘actions’ on the currently selected item by C-z.
	 ("C-z" . helm-select-action)
	 ;; Let's keep tab-completetion anyhow.
	 ("TAB"   . helm-execute-persistent-action)
	 ("<tab>" . helm-execute-persistent-action)))


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

;; Magit
(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package git-gutter
  :ensure t
  :init
  (global-git-gutter-mode t))
  
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

;; Pyvenv
(use-package pyvenv)
(pyvenv-mode)

;; elpy
(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

;; eglot
(use-package eglot :ensure t)
(defun custom/python-occur-definitions ()
  (interactive)
  (let ((list-matching-lines-face nil))
    (occur "^ *\\(async def\\|def\\|class\\) "))
  (let ((window (get-buffer-window "*Occur*")))
    (if window
	(select-window window)
      (switch-to-buffer "*Occur*"))))
;;(define-key lsp-mode-map (kbd "C-c C-o") 'custom/python-occur-definitions)
(define-key eglot-mode-map (kbd "C-c C-o") 'custom/python-occur-definitions)


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


;; restclient
(use-package restclient
  :ensure t
  :mode ("\\.http\\'" . restclient-mode))

(use-package restclient-helm
  :ensure t)


(eldoc-mode 1) ; enable docs in minibuffer

;; store all backups in a single directory 
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; y or n instead of yes-or no
(fset 'yes-or-no-p 'y-or-n-p)

;; follow symlinks
(setq vc-follow-symlinks t)

;; projectile do not try to follow git submodules
(setq projectile-git-submodule-command nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("08a27c4cde8fcbb2869d71fdc9fa47ab7e4d31c27d40d59bf05729c4640ce834" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" default)))
 '(helm-completion-style (quote emacs))
 '(package-selected-packages
   (quote
    (restclient-helm yaml-mode which-key use-package treemacs-projectile smartparens restclient pyenv-mode paredit markdown-mode magit json-mode helm-rg helm-projectile helm-ag git-gutter exec-path-from-shell elpy eglot doom-themes color-identifiers-mode cider better-defaults all-the-icons))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
