;Repository Setup
(require 'package)
(add-to-list 'package-archives'("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


;Package Installs
(unless package-archive-contents
  (package-refresh-contents))

;Install and update the use-package mode when missing
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package)
)

;Install company mode when missing
(unless(package-installed-p 'company)
  (package-refresh-contents)
  (package-install 'company)
)

;Install lsp-ui mode when missing
(unless(package-installed-p 'lsp-ui)
  (package-refresh-contents)
  (package-install 'lsp-ui)
  )

;Install php-mode mode when missing
(unless(package-installed-p 'php-mode)
  (package-refresh-contents)
  (package-install 'php-mode)
)

;PHP file hooks
(dolist (hook '(php-mode-hook))
  (add-hook hook (lambda () (flyspell-mode 1)))
  (add-hook hook (lambda () (lsp)))
  (setq lsp-clients-php-server-command "/usr/bin/phpactor")
  (setq lsp-enable-file-watchers nil)
  )





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(php-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
