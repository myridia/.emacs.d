# ![emacs.d](pages/public/img/icon_192x192.png) emacs.d

# Emacs IDE Starter Configuration

A multi-language IDE configuration for Emacs with auto-formatting on save, LSP support, and smart completion. Optimized for web development, systems programming, and scripting.

```
((...)) 
( o o ) 
 \   / 
  ^_^ 
```


## Requirements 
* Install those programs what the emacs wrapper uses
```bash
	./requirement.sh
```

## Add Repository
```
git remote add codeberg ssh://git@codeberg.org/veto/emacs.d.git
git push codeberg
```


Here's a tailored **README.md** for your specific Emacs configuration:




## ✨ Features

- **Auto-formatting on save** for 10+ languages (C, Python, PHP, JS, Rust, Shell, etc.)
- **LSP integration** via `lsp-mode` with `lsp-ui`
- **Syntax checking** with `flycheck`
- **Auto-completion** with `company` + `anaconda` (Python)
- **Project management** with `projectile` + `helm` integration
- **Fuzzy finding** with `helm`, `helm-lsp`, `helm-xref`
- **Custom utilities** for development workflow
- **No lockfiles** + centralized backups (`~/.saves`)

## 🚀 Quick Start

### 1. Backup & Clone
```bash
mv ~/.emacs.d ~/.emacs.d.backup.$(date +%Y%m%d)
git clone https://github.com/myridia/emacs_starter.git ~/.emacs.d
```

### 2. Install External Tools

This config requires several external formatters and language servers:

```bash
# PHP (Required for PHP mode)
sudo curl -Lo /usr/bin/php-cs-fixer https://cs.symfony.com/download/php-cs-fixer-v3.phar
sudo chmod +x /usr/bin/php-cs-fixer

sudo curl -Lo /usr/bin/phpactor https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar
sudo chmod +x /usr/bin/phpactor

# JavaScript/Vue (Required for JS/Vue/HTML modes)
sudo npm i -g prettier

# Python (Required for Python mode)
curl -LsSf https://astral.sh/ruff/install.sh | sh

# C/C++ (Optional, for formatting)
# clang-format (usually available via: sudo apt install clang-format)

# Shell/Bash (Optional, for formatting)
# shfmt (available via: sudo apt install shfmt or brew install shfmt)

# PlantUML (Optional)
sudo apt install plantuml  # or equivalent for your OS
```

### 3. Launch Emacs
```bash
emacs
```
All packages will auto-install on first run.

## 🛠️ Language Support & Formatting

| Language | Mode | Formatter | LSP Server |
|----------|------|-----------|------------|
| **C/C++** | `cc-mode` | `clang-format` | clangd |
| **Python** | `python-mode` | `ruff-format` | anaconda (built-in) |
| **PHP** | `php-mode` | `php-cs-fixer` | phpactor |
| **JavaScript** | `js2-mode` | `prettier` | lsp-mode |
| **Vue** | `vue-mode` | `prettier` | lsp-mode |
| **HTML** | `html-mode` | `prettier` | - |
| **Rust** | `rust-mode` | `rustfmt` | rust-analyzer |
| **Go** | `go-mode` | gofmt | gopls |
| **Shell** | `sh-mode` | `shfmt` | bash-language-server |
| **YAML** | `yaml-mode` | - | - |
| **Markdown** | `markdown-mode` | - | - |
| **Kotlin** | `kotlin-mode` | - | kotlin-language-server |
| **Docker** | `docker-compose-mode` | - | - |
| **PlantUML** | `plantuml-mode` | - | - |
| **AutoHotkey** | `ahk-mode` | - | - |
| **CMake** | `cmake-mode` | - | - |

## ⌨️ Key Bindings

### Custom Shortcuts
| Key | Function | Description |
|-----|----------|-------------|
| `M-/` | `test-fn` | Test function (prints "Hello World") |
| `C-c f` | `get_buffer_path` | Copy/show current buffer file path |
| `C-c c` | `insert_console` | Insert `console.log('');` (JS debug helper) |

### Standard IDE Bindings
| Key | Action |
|-----|--------|
| `M-x lsp` | Start LSP server manually |
| `M-x projectile-find-file` | Find file in project |
| `M-x helm-lsp-workspace-symbol` | Search workspace symbols |
| `M-x flycheck-list-errors` | Show error list |

## ⚙️ Configuration Details

### Auto-Formatting Behavior

- **C/C++**: Uses `format-all-mode` with `clang-format` (2-space indent)
- **Shell**: Uses `shfmt` with `-i 2 -ci` (2 spaces, indent cases)
- **Python**: Uses `ruff-format-on-save-mode` 
- **PHP**: Uses `php-cs-fixer-before-save` hook
- **JavaScript/Vue/HTML**: Uses `prettier-js-mode`
- **Rust**: Native `rust-format-on-save` (uses rustfmt)

### PHP-Specific Setup

For PHP 8.4 compatibility, the config sets:
```elisp
(setenv "PHP_CS_FIXER_IGNORE_ENV" "true")
```

Ensure `phpactor` and `php-cs-fixer` are in `/usr/bin/` or update paths:
```elisp
(setq lsp-clients-php-server-command "/usr/bin/phpactor")
(setq lsp-phpactor-path "/usr/bin/phpactor")
(setq lsp-php-composer-dir "~/.config/composer")
```

### Python Setup

Uses `anaconda-mode` + `company-anaconda` for completion, and `ruff` for formatting.

### Backup & Lockfiles

- **Lockfiles disabled**: `(setq create-lockfiles nil)`
- **Backups saved to**: `~/.saves/` instead of scattered `#file#` files

## 🔧 Troubleshooting

### PHP formatting not working
1. Check binary exists: `ls -la /usr/bin/php-cs-fixer`
2. Make executable: `sudo chmod +x /usr/bin/php-cs-fixer`
3. Test manually: `php-cs-fixer fix --dry-run yourfile.php`

### Python formatting errors
Ensure ruff is installed: `which ruff`
If using local venv, install ruff there too: `pip install ruff`

### JavaScript/Vue formatting not working
Check prettier: `which prettier`
If using nvm, ensure node is in PATH when launching Emacs.

### LSP not starting
Install language servers:
- **C/C++**: `sudo apt install clangd`
- **Rust**: `rustup component add rust-analyzer`
- **Go**: `go install golang.org/x/tools/gopls@latest`

### Package signature errors
If MELPA packages fail to install due to signature checks, temporarily enable:
```elisp
(setq package-check-signature nil)
```
Then run `M-x package-install RET gnu-elpa-keyring-update`, then disable it again.

## 📝 Custom Functions

### `get_buffer_path()`
Displays and copies the full path of the current buffer to the kill ring.

### `insert_console()`
Inserts `console.log('');` at cursor and places cursor inside quotes for JavaScript debugging.

## 🎨 UI Customizations

- Startup message disabled, replaced with ASCII art
- Cursor set to bar style (`cursor-type 'bar`)
- Line numbers available but commented out (uncomment `(add-hook 'prog-mode-hook 'display-line-numbers-mode)` to enable)
- Vue mode submode decorations disabled (removes ugly backgrounds)

## 📦 Installed Packages

- **Core**: `use-package`, `lsp-mode`, `lsp-ui`, `company`, `flycheck`, `projectile`
- **Navigation**: `helm-lsp`, `helm-xref`, `avy`, `which-key`, `hydra`
- **Languages**: `js2-mode`, `vue-mode`, `php-mode`, `python-mode`, `rust-mode`, `go-mode`, `kotlin-mode`, `web-mode`, `markdown-mode`, `yaml-mode`, `docker-compose-mode`, `cmake-mode`, `ahk-mode`, `plantuml-mode`
- **Formatting**: `format-all`, `prettier-js`, `php-cs-fixer`, `ruff-format`, `clang-format`
- **Utils**: `yasnippet`, `lsp-treemacs`, `dap-mode` (debugging), `svg-tag-mode`

## 🤝 Contributing

This is a personal starter config. Feel free to fork and modify for your workflow. Key areas to customize:
- Formatter arguments in `format-all-formatters` (currently set to 2-space indent)
- PHP paths if using different install locations
- Additional `company-backends` for specific languages

## ⚠️ Notes

- This config uses `lsp-mode` (not Eglot)
- Formatters must be installed manually (not managed by Emacs)
- First startup will take time downloading packages from MELPA
```

