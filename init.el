;; ===== PACKAGES =========
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; ========= COLORS ==========
;; Set emacs background colour
;;(setq default-frame-alist
;;      (append (list '(foreground-color . "black")
;;		    '(background-color . "LemonChiffon")
;;		    '(border-color . "black")
;;		    '(width . 120)
;;		    '(height . 55)
;;		    '(top . 0)
;;		    '(left . 0))
;;	      default-frame-alist))

(set-background-color "LemonChiffon")

;;=========== FONTS ============
(global-font-lock-mode t)
;;(set-default-font "-adobe-symbol-medium-r-normal--20-140-100-100-p-107-adobe-fontspecific")

;; ========= SELECTION  ==========
(setq transient-mark-mode t)
(set-face-background 'region "gray")

;;===== TIME, NUMBERING ==========
(display-time)
(line-number-mode 1)
(column-number-mode 1)
;; Line-wrapping
(set-default 'fill-column 100)


;;===== MISC =========
;; remove the scroll bar (I never use it anyway)
(toggle-scroll-bar -1)

;; no startup msg  
(setq inhibit-startup-message t)       

;; set truncate lines as default
;;(setq-default truncate-lines t)

;; define an alias for truncating lines
;; M-x tt return
(defalias 'tt 'toggle-truncaee-lines)

;; activates mouse scroll
(mouse-wheel-mode t)

;; ============== BUFFER SWITCHING =============================
;; The intelligent buffer switching package! so much nicer than
;; default.  Now C-x b becomes an "incremental search through buffers"
;; just begin typing any part of the name you want to find!  C-s
;; cycles through the choices until you find what you want, hit ENTER.
(require 'iswitchb)
(iswitchb-mode 1) 

;;===== COMPANY MODE =========
;; globally enable company mode by default
(add-hook 'after-init-hook 'global-company-mode)
(require 'company-c-headers)
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-c-headers))

;;use company-mode with Clang 
(require 'cc-mode)
(with-eval-after-load 'company 
  (setq company-backends (delete 'company-semantic company-backends))
  (define-key c-mode-map  [(tab)] 'company-complete)
  (define-key c++-mode-map  [(tab)] 'company-complete))

;;use C++11 by default
(set 'company-clang-arguments (list "-std=gnu++11"))

(with-eval-after-load 'company 
  (add-to-list 'company-c-headers-path-system "/usr/include/c++/5.4.0/"))

;; SEMANTIC HAS TROUBLE FINDING STD LIBRARIES
;;(semantic-mode 1)
;;(require 'cc-mode)
;;(require 'semantic)
;;(global-semanticdb-minor-mode 1)
;;(global-semantic-idle-scheduler-mode 1)
;;(semantic-add-system-include "/usr/include/c++/5.4.0" 'c++-mode)
;;(semanticdb-enable-gnu-global-databases 'c++-mode t)

;;===== CLANG =========
(require 'clang-format)
  (global-set-key (kbd "C-c u") 'clang-format-buffer)
  (setq clang-format-style-option "google")

;;===== LATEX =========

;;(setq TeX-auto-save t)
;;(setq TeX-parse-self t)
;;(setq-default TeX-master nil)

(add-to-list 'auto-mode-alist '("\\.tex$" . LaTeX-mode))

(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
(add-hook 'LaTeX-mode-hook 'tex-pdf-mode)

;; Math mode for LaTex
;;(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;;============== PYTHON ===================



