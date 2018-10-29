;; nomnoml mode
(defvar nomnoml-mode-hook nil
  "initial hook for nomnoml mode"
  )

(defun nomnoml-compilation-mode-hook ()
  "Hook function to set local value for `compilation-error-screen-columns'."
  ;; In Emacs > 20.7 compilation-error-screen-columns is buffer local.
  (or (assq 'compilation-error-screen-columns (buffer-local-variables))
      (make-local-variable 'compilation-error-screen-columns))
  (setq compilation-error-screen-columns nil))

(defvar nomnoml-output-format 'svg
  "The format of generated file")

(defvar nomnoml-verbose nil
  "Show verbose information when run compiler")

(defvar nomnoml-compiler "nomnoml"
  "The compiler used to generate output")

(defvar nomnoml-mode-map
  (let ((map (make-sparse-keymap)))
    ;; add key bindings for nomnoml mode here
    ;;
    (define-key map "\C-c\C-c" 'nomnoml-compile)
    (define-key map "\C-c\C-v" 'nomnoml-view)
    map)
  "Keymap for nomnoml mode")

;;;###autoload
(defun nomnoml-compile ()
  (interactive)
  (let ((cmd (concat nomnoml-compiler
                     " " buffer-file-name
                     " " buffer-file-name ".svg"))
        (buf-name "*nomnoml compilation")
        (compilation-mode-hook (cons 'nomnoml-compilation-mode-hook compilation-mode-hook)))
    (if (fboundp 'compilation-start)
        (compilation-start cmd nil
                           #'(lambda (mode-name)
                               buf-name))
      (compile-internal cmd "No more errors" buf-name))))

;;;###autoload
(defun nomnoml-view ()
  (interactive)
  (let ((dst-file-name (concat (buffer-file-name) ".svg")))
    (if (file-exists-p dst-file-name)
        (browse-url dst-file-name)
      (error "Please compile the it first!\n"))))

;; disable debug in default
;;
(defvar nomnoml-debug-enabled nil
  "enable/disable debug")

(defmacro nomnoml-debug (fmt &rest args)
  `(when nomnoml-debug-enabled
     (message ,fmt ,@args)))

;;;###autoload
(defun nomnoml-mode ()
  "Major mode for editing nomnoml scripts"
  (interactive)
  (kill-all-local-variables)
  (use-local-map nomnoml-mode-map)
  (setq major-mode 'nomnoml-mode)
  (setq mode-name "nomnoml")
  (run-hooks 'nomnoml-mode-hook))

(add-to-list 'auto-mode-alist '("\\.uml\\'" . nomnoml-mode))

(provide 'nomnoml-mode)
