(find-file "~/")
(find-file "/home/")
(find-file "/etc/cron.d/")
(find-file "/etc/apache2/")
(find-file "/etc/haproxy/")
(find-file "/var/log/apache2/")
(find-file "/etc/sudoers.d/")

;;;;;;;;;;;;;;;;;;;;;;
;browse buffers 
;;;;;;;;;;;;;;;;;;;;;

(setq kk_buffer_list_index 1)
(defun kk-browse-buffer-list (forward)
  (setq kk_buffer_list_index (+ kk_buffer_list_index forward))
  (setq kk_buffer_list_index 
	(cond 
	 ((eq kk_buffer_list_index -1) 7) 
	 ((eq kk_buffer_list_index 8) 0) 
	 (t kk_buffer_list_index)
	 )
	)
  (switch-to-buffer (elt (buffer-list) kk_buffer_list_index) t)
)

(defun kk-browse-buffer-list-forward ()
  (interactive)
  (kk-browse-buffer-list 1)
)

(defun kk-browse-buffer-list-backward ()
  (interactive)
  (kk-browse-buffer-list -1)
)

(global-set-key [f2] 'kk-browse-buffer-list-forward)
(global-set-key [f3] 'kk-browse-buffer-list-backward)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; open buffer list
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(fset 'kk-goto-buffer-list
   "\C-x\C-b\C-xo")
(global-set-key [f4] 'kk-goto-buffer-list)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; other window
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key [f5] 'other-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; copy word
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun kk-copy-word ()
(interactive)
(re-search-backward "[^-0-9a-zA-Z_]+")
(forward-char)
(setq kk-beg (point))
(re-search-forward "[-0-9a-zA-Z_]+")
(setq kk-end (point))
(kill-ring-save kk-beg kk-end)
)

;copy word into kill ring
(global-set-key [f6] 'kk-copy-word)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; copy line
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defalias 'x-copy-line01
  ;(read-kbd-macro "ESC x kk- copy- line RET C-x C-x <C-insert> C-e"))
  (read-kbd-macro "C-a C-SPC C-e <C-insert>"))

(global-set-key [f7] 'x-copy-line01)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; open directory of the current file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defalias 'kk-open-dir01
  (read-kbd-macro "C-x C-f <backspace> RET yg"))

(global-set-key [f8] 'kk-open-dir01)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; fetch line, assume it is a path, open file
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defalias 'kk-open-file01
  (read-kbd-macro "<f7> C-x C-f C-a C-y C-k RET"))

(global-set-key [f9] 'kk-open-file01)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; open some shells
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq kk-file-slash "/")
;open some shells
(defun kk-open-some-shells () 
  (interactive)
  (progn
    (setq kk-shells-dir (concat "/tmp/emacs-shells-" (getenv "USER") ) )
    (setq process-ident (start-process "mkdir-process" "*scratch*" "/bin/bash"  "-c" (concat "echo;mkdir " kk-shells-dir) "a" "b"))
    (setq process-ident (start-process "mkdir-process" "*scratch*" "/bin/bash"  "-c" (concat "echo;chmod go-rwx " kk-shells-dir) "a" "b"))
    (shell)
    (setq kk-time-tag (concat (format "%d" (nth 0 (current-time))) (format "%d" (nth 1 (current-time))) ))
    (write-file (concat kk-shells-dir kk-file-slash   "shell-linux-3-" kk-time-tag))
    (shell)
    (write-file (concat kk-shells-dir kk-file-slash   "shell-linux-4-" kk-time-tag))
    (shell)
    (write-file (concat kk-shells-dir kk-file-slash   "shell-linux-5-" kk-time-tag))
    (shell)
    (write-file (concat kk-shells-dir kk-file-slash   "shell-linux-6-" kk-time-tag))
    (setq dd01_shell_7 (get-buffer-process (shell)))
    (write-file (concat kk-shells-dir kk-file-slash   (setq dd01_shell_7_buffer (concat "shell-linux-7-" kk-time-tag))))
    (setq dd01_shell_8 (get-buffer-process (shell)))
    (write-file (concat kk-shells-dir kk-file-slash   "shell-linux-8-" kk-time-tag))

    (setq dd01_shell_run_build_tribasic (get-buffer-process (shell)))
    (write-file (concat kk-shells-dir kk-file-slash   (setq dd01_shell_run_build_tribasic_buffer (concat "shell-linux-run_build_tribasic-" kk-time-tag))))

    (setq dd01_shell_run_download_ftp (get-buffer-process (shell)))
    (write-file (concat kk-shells-dir kk-file-slash   (setq dd01_shell_run_download_ftp_buffer (concat "shell-linux-run_download_ftp-" kk-time-tag))))

    (setq dd01_shell_run_restart_evolution (get-buffer-process (shell)))
    (write-file (concat kk-shells-dir kk-file-slash   (setq dd01_shell_run_restart_evolution_buffer (concat "shell-linux-run_restart_evolution-" kk-time-tag))))

    (shell)
    (write-file (concat kk-shells-dir kk-file-slash   "shell-linux-4-mytxi0955-pyt-atlanta-" kk-time-tag))
    (shell)
    (write-file (concat kk-shells-dir kk-file-slash   "shell-linux-4-mytxi0955-pyt-buffalo-" kk-time-tag))
    (shell)
    (write-file (concat kk-shells-dir kk-file-slash   "shell-linux-4-clonegitlabstudie-" kk-time-tag))
    (shell)
    (write-file (concat kk-shells-dir kk-file-slash   "shell-linux-4-contact20000-" kk-time-tag))
    (shell)
    (write-file (concat kk-shells-dir kk-file-slash   "shell-linux-4-contact20000gen-" kk-time-tag))
    (shell)
    (write-file (concat kk-shells-dir kk-file-slash   "shell-linux-4-v3_django-saleor-txi0955-" kk-time-tag))
    (shell)
    (write-file (concat kk-shells-dir kk-file-slash   "shell-linux-4-v4_django-saleor-txi0955-" kk-time-tag))
    (shell)
    (write-file (concat kk-shells-dir kk-file-slash   "shell-linux-4-contact-django-saleor-contact-" kk-time-tag))

    (setq dd01_shell_errorlog (get-buffer-process (shell)))
    (write-file (concat kk-shells-dir kk-file-slash   (setq dd01_shell_errorlog_buffer (concat "shell-linux-errorlog-" kk-time-tag))))
    (process-send-string dd01_shell_errorlog (concat "tail -f /var/log/apache2/error.log\n"))


;(shell)
;(write-file (concat kk-shells-dir kk-file-slash   "shell-linux-9-" kk-time-tag))
;(shell)
;(write-file (concat kk-shells-dir kk-file-slash   "shell-linux-10-" kk-time-tag))
    )
  )

(kk-open-some-shells)
