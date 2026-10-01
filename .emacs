(package-initialize)
(require 'package)
(setq package-check-signature nil)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(when (not package-archive-contents) (package-refresh-contents))
(let ((my-packages
       '(
         lua-mode
         ggtags
         git-gutter
         rtags
         levenshtein
         multiple-cursors
         rainbow-identifiers
         avy
         treemacs
         zenburn-theme
         ample-zen-theme
         ample-theme
         bubbleberry-theme
         darkokai-theme
         gruber-darker-theme
         gruvbox-theme
         distinguished-theme
         monokai-theme
         greymatters-theme
         grayscale-theme
         monotropic-theme
         zeal-at-point
         markdown-preview-eww
         eww-lnum
         pytest
         git-lens
         scala-mode
         magit
         rainbow-delimiters
         elpy
         anaconda-mode
         osx-clipboard
         2048-game
         git-gutter
         git-timemachine
         typescript-mode
         dash-at-point
         dash
         seq
         )
       )
      (refreshed? nil)
      )
  (dolist (p my-packages)
    (unless (package-installed-p p)
      (when (null refreshed?)
        (package-refresh-contents)
        (setq refreshed? t))
      (package-install p)))
  )

(require 'mwheel)
(require 'mouse)
(require 'subr-x)
(require 'multiple-cursors)
(require 'rtags)
(require 'levenshtein)
; (require 'cmake-ide)

(global-auto-revert-mode 1)
(global-git-gutter-mode +1)
(global-font-lock-mode 1)
(xterm-mouse-mode t)
(mouse-wheel-mode t)
(global-set-key [mouse-5] 'next-line)
(global-set-key [mouse-4] 'previous-line)
(menu-bar-mode -1)
(delete-selection-mode t)
(transient-mark-mode t)
(column-number-mode t)
(ido-mode t)

;(with-eval-after-load 'magit-mode (add-hook 'after-save-hook 'magit-after-save-refresh-status t))
;(add-hook
; 'c-mode-common-hook
; (lambda ()
;   (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
;     (ggtags-mode 1)
;     )
;   )
; )

(add-hook 'dired-mode-hook 'ggtags-mode)


(setq
 gdb-many-windows t
 gdb-show-main t
 shift-select-mode t
 python-shell-interpreter "python3"
 python-shell-interpreter-args "-i"
 user-full-name ""
 user-mail-address ""
 vc-git-program "git"
 backup-by-copying t
 backup-directory-alist '(("." . "~/.saves"))
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t
 vc-handled-backends ()
 c-default-style "bsd"
 x-select-enable-clipboard t
 debug-on-error t
 ido-enable-flex-matching t
 ido-use-virtual-buffers t
 backup-directory-alist `((".*" . ,temporary-file-directory))
 auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
)
(setq-default
 c-basic-offset 4
 tab-width 4
 indent-tabs-mode nil
 )
(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook
 'python-mode-hook
 (lambda ()
   (setq
    python-indent-offset 4
    indent-tabs-mode nil
    python-indent 4
    tab-width 4
    )
   )
 )

(global-set-key (kbd "<M-RET>") 'shell)
(global-set-key (kbd "C-c <up>") 'previous-multiframe-window)
(global-set-key (kbd "C-c <down>") 'next-multiframe-window)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(global-set-key (kbd "C-c C-q") 'mc/edit-lines)
(global-set-key (kbd "C-c <right>") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c <left>") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-a") 'mc/mark-all-like-this)


; (autoload 'cmake-mode "cmake-mode" "CMake editing mode." t)
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(autoload 'sql "sql-mode" "sql editing mode." t)
(autoload 'typescript-mode "typescript-mode" "Typescript editing mode." t)
; (add-to-list 'auto-mode-alist '("\\.cmake$" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'auto-mode-alist '("\\.sql$" . sql-mode))
(add-to-list 'auto-mode-alist '("\\.ts$" . typescript-mode))
; (add-to-list 'auto-mode-alist '("\\CMakeLists.txt$" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\SConstruct$" . python-mode))
(add-to-list 'auto-mode-alist '("\\XAN_MAKEFILE$" . lua-mode))
(add-to-list 'display-buffer-alist '("^\\*shell\\*$" . (display-buffer-same-window)))
; (add-to-list 'interpreter-mode-alist '("cmake" . cmake-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(if
    (eq system-type 'darwin)
    (global-set-key "\C-c\h" 'dash-at-point)
  (add-to-list 'dash-at-point-mode-alist '(lua-mode . "lua"))
  ; (add-to-list 'dash-at-point-mode-alist '(cmake-mode . "cmake"))
  (add-to-list 'dash-at-point-mode-alist '(sh-mode . "bash"))
  (add-to-list 'dash-at-point-mode-alist '(c-mode . "c"))
  (add-to-list 'dash-at-point-mode-alist '(c++-mode . "c++"))
  (add-to-list 'dash-at-point-mode-alist '(go-mode . "go"))
  (add-to-list 'dash-at-point-mode-alist '(perl-mode . "perl"))
  (add-to-list 'dash-at-point-mode-alist '(python-mode . "python3"))
  )
;(if
;    (eq system-type 'gnu/linux)
;    (global-set-key (kbd "C-c h") 'zeal-at-point)
;  (add-to-list 'zeal-at-point-mode-alist '(lua-mode . "lua"))
;  (add-to-list 'zeal-at-point-mode-alist '(cmake-mode . "cmake"))
;  (add-to-list 'zeal-at-point-mode-alist '(sh-mode . "bash"))
;  (add-to-list 'zeal-at-point-mode-alist '(c-mode . "c"))
;  (add-to-list 'zeal-at-point-mode-alist '(c++-mode . "c++"))
;  (add-to-list 'zeal-at-point-mode-alist '(go-mode . "go"))
;  (add-to-list 'zeal-at-point-mode-alist '(perl-mode . "perl"))
;  (add-to-list 'zeal-at-point-mode-alist '(python-mode . "python3"))
;  )

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(global-set-key (kbd "C-x <deletechar>") 'kill-whitespace-or-word)

(defun move-text-internal (arg)
   (cond
    ((and mark-active transient-mark-mode)
     (if (> (point) (mark))
            (exchange-point-and-mark))
     (let ((column (current-column))
              (text (delete-and-extract-region (point) (mark))))
       (forward-line arg)
       (move-to-column column t)
       (set-mark (point))
       (insert text)
       (exchange-point-and-mark)
       (setq deactivate-mark nil)))
    (t
     (beginning-of-line)
     (when (or (> arg 0) (not (bobp)))
       (forward-line)
       (when (or (< arg 0) (not (eobp)))
            (transpose-lines arg))
       (forward-line -1)))))

(defun move-text-down (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines down."
   (interactive "*p")
   (move-text-internal arg))

(defun move-text-up (arg)
   "Move region (transient-mark-mode active) or current line
  arg lines up."
   (interactive "*p")
   (move-text-internal (- arg)))

(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)
(global-set-key (kbd "C-<pageup>") 'beginning-of-buffer)
(global-set-key (kbd "C-<pagedown>") 'end-of-buffer)
(global-set-key "\M-q" 'query-replace-regexp)
(global-set-key "\M-r" 'query-replace)
(custom-set-variables
 '(package-selected-packages
   '(dash-at-point
                                        ;cmake-mode
     zenburn-theme treemacs scala-mode rainbow-identifiers pytest multiple-cursors monotropic-theme monokai-theme markdown-preview-eww lua-mode gruvbox-theme gruber-darker-theme greymatters-theme grayscale-theme git-lens git-gutter ggtags eww-lnum distinguished-theme darkokai-theme
                                        ; cmake-ide
     bubbleberry-theme ample-zen-theme ample-theme)))
(custom-set-faces
 )
