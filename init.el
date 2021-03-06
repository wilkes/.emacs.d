(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; desired starter-kit packages
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-eshell
                                  starter-kit-js starter-kit-bindings
                                  clojure-mode clojure-test-mode nrepl
                                  projectile rainbow-delimiters rainbow-mode
                                  ir-black-theme less-css-mode
                                  color-theme-sanityinc-solarized
                                  color-theme-sanityinc-tomorrow
                                  ac-nrepl clojure-snippets
                                  cljsbuild-mode)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; add themes folder to theme load path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

(load-theme 'sanityinc-solarized-light t)

;; turn off annoying visual-bell
(setq visible-bell nil)

;; save backup files to ~/.saves
(setq backup-directory-alist `(("." . "~/.saves")))

;; Globals
(global-rainbow-delimiters-mode)
(projectile-global-mode)
(setq projectile-globally-ignored-files '("TAGS" "*.js"))

;; Terminal specific configurations
(unless window-system
  ;; Enable mouse support
  (require 'mouse)
  (xterm-mouse-mode t)

  (defun up-slightly () (interactive) (scroll-up 5))
  (defun down-slightly () (interactive) (scroll-down 5))

  (global-set-key (kbd "<mouse-4>") 'down-slightly)
  (global-set-key (kbd "<mouse-5>") 'up-slightly)
  (global-set-key (kbd "<menu-bar> <mouse-4>") 'down-slightly)
  (global-set-key (kbd "<menu-bar> <mouse-5>") 'up-slightly)

  (defun track-mouse (e))
  (setq mouse-sel-mode t))

;; Window system specific configurations
(when window-system
  ;;(set-face-attribute 'default nil :font "Droid Sans Mono" :height 150) ;; font & font size
  ;;(set-default-font "-apple-Inconsolata-medium-normal-normal-*-18-*-*-*-m-0-iso10646-1")

  (set-face-attribute 'default nil :font "Inconsolata" :height 180) ;; font & font size
  (server-start)
  (eshell))

;; cosmetics
;; lose the stupid pipe chars on the split-screen bar
(set-face-foreground 'vertical-border "#202020")
(set-face-background 'vertical-border "#202020")
(remove-hook 'prog-mode-hook 'esk-turn-on-hl-line-mode)

;; other options
;; set ispell program name to aspell (brew install aspell)
(setq-default ispell-program-name "aspell")

(load "~/.emacs.d/functions")
(load "~/.emacs.d/bindings")
(load "~/.emacs.d/modes")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
