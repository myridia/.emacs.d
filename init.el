(defvar x "https://github.com/myridia/emacs_starter
((...)) 
( o o ) 
 \   /  
  ^_^   
")
;(print x)
(setq inhibit-startup-message t initial-scratch-message x cursor-type 'bar)

;Save all backupfiles to .saves instead 
(setq backup-directory-alist `(("." . "~/.saves")))

;Repository Setup
(require 'package)
(add-to-list 'package-archives'("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


;Package Installs
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
)

(unless(package-installed-p 'rust-mode)
  (package-refresh-contents)
  (package-install 'rust-mode)
)

(unless(package-installed-p 'markdown-mode)
  (package-refresh-contents)
  (package-install 'markdown-mode)
  )

(unless(package-installed-p 'company)
  (package-refresh-contents)
  (package-install 'company)
)

(unless(package-installed-p 'lsp-ui)
  (package-refresh-contents)
  (package-install 'lsp-ui)
  )

(unless(package-installed-p 'anaconda-mode)
  (package-refresh-contents)
  (package-install 'anaconda-mode)
  )

(unless(package-installed-p 'company-anaconda)
  (package-refresh-contents)
  (package-install 'company-anaconda)
  )

(unless(package-installed-p 'docker-compose-mode)
  (package-refresh-contents)
  (package-install 'docker-compose-mode)
  )

(unless(package-installed-p 'yaml-mode)
  (package-refresh-contents)
  (package-install 'yaml-mode)
)


(unless(package-installed-p 'php-mode)
  (package-refresh-contents)
  (package-install 'php-mode)
)

(unless(package-installed-p 'web-mode)
  (package-refresh-contents)
  (package-install 'web-mode)
)

(unless(package-installed-p 'plantuml-mode)
  (package-refresh-contents)
  (package-install 'plantuml-mode)
  )

(unless(package-installed-p 'svg-tag-mode)
  (package-refresh-contents)
  (package-install 'svg-tag-mode)
  )

(unless(package-installed-p 'go-mode)
  (package-refresh-contents)
  (package-install 'go-mode)
  )

(unless(package-installed-p 'kotlin-mode)
  (package-refresh-contents)
  (package-install 'kotlin-mode)
  )

;Hooks
;(add-hook 'prog-mode-hook 'display-line-numbers-mode)

;Text file hooks
(dolist (hook '(text-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1)))
)

;Rust file hooks
(dolist (hook '(rust-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1)))
  (add-hook hook (lambda () (lsp)))  
  (add-hook hook (lambda () (setq indent-tabs-mode nil)))
  (add-hook hook (lambda () (setq rust-format-on-save t)))
)

;Js file hooks
(dolist (hook '(js-mode-hook))
 (add-hook hook (lambda () (flyspell-mode 1)))
 (add-hook hook (lambda () (global-company-mode)))
 (add-hook hook (lambda () (setq indent-tabs-mode nil))) 
)

(dolist (hook '(python-mode-hook))
 (add-hook hook (lambda () (flyspell-mode 1)))
 (add-hook hook (lambda () (anaconda-mode )))
 (add-hook hook (lambda () (global-company-mode)))
 )


;PHP file hooks
(dolist (hook '(php-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1)))
 ; (add-hook hook (lambda () (lsp)))
  (setq lsp-clients-php-server-command "/usr/bin/phpactor")
  (setq lsp-phpactor-path "/usr/bin/phpactor")
  (setq lsp-php-composer-dir "/home/veto/.config/composer")  
  
  (setq lsp-enable-file-watchers nil)
  )

;PlantUML
(dolist (hook '(plantuml-mode-hook))
(setq org-plantuml-jar-path (expand-file-name "/usr/bin/plantuml"))
;(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t)))
  )


;Associates
(add-to-list 'auto-mode-alist '("Dockerfile" . docker-compose-mode))


;Function test
(defun test-fn ()
  (interactive)
  (message "Hello World")
)


(defun test-test-fn ()
  (interactive)
  (test-fn)
)


(defun get_buffer_path ()                   
  (interactive)
  (message (buffer-file-name))                                                           
  )

(defun insert_console ()                   
  (interactive)
  (insert-before-markers "console.log('');")
  (backward-char 3)
  )  

(global-set-key (kbd "M-/") (lambda () (interactive) (test-fn)))
(global-set-key (kbd "C-c f") (lambda () (interactive) (get_buffer_path)))
(global-set-key (kbd "C-c c") (lambda () (interactive) (insert_console)))  



(eval-after-load "company"
 '(add-to-list 'company-backends '(company-anaconda :with company-capf)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(go-mode go svg-mode-line-themes svg-tag-mode ## docker-compose-mode dockerfile-mode company-anaconda anaconda-mode company-jedi jedi logview ac-js2 eglot helm yasnippet company lsp-ui lsp-mode rust-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
