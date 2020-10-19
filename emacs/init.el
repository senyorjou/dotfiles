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


;; miscellania
(global-set-key (kbd "C-\\") 'comment-or-uncomment-region) ; easy binding for commenting

;;(scroll-bar-mode 0) ; no scroll bar
;;(tool-bar-mode 0) ; no tool bar
;;(menu-bar-mode 0) ; no menu bar
(show-paren-mode 1) ; visualize matching parenthesees
(global-hl-line-mode 1) ; highlight current line
(eldoc-mode 1) ; enable docs in minibuffer
;; (setq inhibit-startup-screen 1) ; no start screen

;; store all backups in a single directory 
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))

;; y or n instead of yes-or no
(fset 'yes-or-no-p 'y-or-n-p)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (helm-rg helm-ag use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
