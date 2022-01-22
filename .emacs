(package-initialize)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
;; Enable Evil
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map "u" 'undo-fu-only-undo)
(define-key evil-normal-state-map "\C-r" 'undo-fu-only-redo)
(global-undo-fu-session-mode)

(setq inhibit-startup-screen t)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
       `((".*" ,temporary-file-directory t)))
(setq undo-fu-session-directory temporary-file-directory)

;; tabs fix
(setq-default tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)


;; maps
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; setters
(show-paren-mode 1)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(ido-mode 1)
(column-number-mode 1)

;; custom set variables
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(blink-cursor-interval 0.3)
 '(custom-enabled-themes '(misterioso))
 '(package-selected-packages '(undo-fu-session undo-fu evil smex))
 '(tool-bar-mode nil))

;; custom set faces
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "ADBO" :slant normal :weight semi-bold :height 120 :width normal))))
 '(font-lock-comment-delimiter-face ((t (:foreground "red"))))
 '(font-lock-comment-face ((t (:foreground "red" :slant normal)))))

(set-foreground-color "white")
(set-background-color "black")
(set-cursor-color "#ffffff")
