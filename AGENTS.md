# AGENTS.md — .emacs.d

## What this is
A multi-language Emacs IDE configuration with auto-formatting on save, LSP support, smart completion, and project management. Optimized for web development, systems programming, and scripting.

## Stack
- Emacs Lisp
- lsp-mode + lsp-ui (LSP)
- company + anaconda (completion)
- flycheck (syntax checking)
- projectile + helm (project navigation)
- format-all / prettier / php-cs-fixer / ruff / rustfmt / indent-region (formatters)
- rainbow-delimiters (rainbow parentheses for `lisp-mode` and `emacs-lisp-mode` only; not JS/C/etc.)
- show-paren-local-mode + electric-pair-mode + optional paredit + repeating paren blink (Lisp/Elisp structural editing and delimiter highlighting only; only the paren away from the cursor toggles background, at the cursor blink rate); global show-paren-mode is off; package signature checks disabled at startup to avoid expired GNU ELPA keys

## Build
No build step. Clone into `~/.emacs.d` and launch Emacs. Packages auto-install on first run.

## Run
```bash
# Install requirements first
./requirement.sh
# Then launch Emacs
emacs
```

## Structure
- `init.el` / `early-init.el` — main Emacs config
- `requirement.sh` — installs external tools (php-cs-fixer, prettier, ruff, etc.)
- `lisp/` — additional config modules (if present)

## Key Bindings
- `C-c f` — copy/show current buffer file path
- `C-c c` — insert `console.log('');`
- `M-x projectile-find-file` — find file in project
- `M-x lsp` — start LSP manually

## Conventions
- `nt-install` installs only when a package is missing, and refreshes archive contents once only if they are not cached. There are no unconditional `package-refresh-contents` calls; `use-package` uses `:ensure nil`.
- No comments in code unless asked.
- Lockfiles disabled; backups go to `~/.saves/`.
- Formatters run on save for 10+ languages; Lisp/Elisp uses `indent-region`.
