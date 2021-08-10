(use-package frame-fns
  :ensure nil
  :load-path "~/.spacemacs.d/packages")
(use-package frame-cmds
  :ensure nil
  :load-path "~/.spacemacs.d/packages")

(define-minor-mode frame-mode
  "Change your frame with alt and hjkl"
  :lighter "\U0001F5BD" ;; an emoji with frame
  :keymap (let ((map (make-sparse-keymap)))
            (define-key map (kbd "M-k") 'move-frame-up)
            (define-key map (kbd "M-j") 'move-frame-down)
            (define-key map (kbd "M-h") 'move-frame-left)
            (define-key map (kbd "M-l") 'move-frame-right)

            ;; Capital means shift
            (define-key map (kbd "M-H") 'shrink-frame-horizontally)
            (define-key map (kbd "M-J") 'shrink-frame)
            (define-key map (kbd "M-K") 'enlarge-frame)
            (define-key map (kbd "M-L") 'enlarge-frame-horizontally)
            map)
  :global t)

(frame-mode)

(spacemacs/set-leader-keys "TH" 'move-frame-to-screen-left)
(spacemacs/set-leader-keys "TJ" 'move-frame-to-screen-bottom)
(spacemacs/set-leader-keys "TK" 'move-frame-to-screen-top)
(spacemacs/set-leader-keys "TL" 'move-frame-to-screen-right)

;; check this setting above dotspacemacs-undecorated-at-startup
(unless (eq system-type 'windows-nt)
  (setq default-frame-alist '((undecorated . t)))
  (add-to-list 'default-frame-alist '(drag-internal-border . 1))
  (add-to-list 'default-frame-alist '(internal-border-width . 5)))
;; Disable annoying highlight current line.
(spacemacs/toggle-highlight-current-line-globally-off)

(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset (font-spec :family "Sarasa Term SC")))

;; sis input method for Windows with im-select plugin
(when (eq system-type 'windows-nt)
  (sis-ism-lazyman-config "1033" "2052" 'im-select))
;; enable the /cursor color/ mode
(sis-global-cursor-color-mode t)
;; enable the /respect/ mode
(sis-global-respect-mode t)
;; enable the /context/ mode for all buffers
(sis-global-context-mode t)
;; enable the /inline english/ mode for all buffers
(sis-global-inline-mode t)
(indent-guide-global-mode +1)

(use-package rime
  :custom
  (default-input-method "rime"))

(use-package evil-snipe)
(progn
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))
(progn
  (setq-default
   evil-snipe-scope 'visible
   evil-snipe-repeat-scope 'buffer))

(define-minor-mode evil-snipe-local-mode
  "Enable `evil-snipe' in the current buffer."
  :lighter "\U0001F946"
  :group 'evil-snipe
  (if evil-snipe-local-mode (evil-snipe--normalize-keymaps)))
