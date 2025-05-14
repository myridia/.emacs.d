# .emacs.d

## Emacs configuration to work with
* Rust
* Python
* PHP
* JavaScript

## Requirements 
* Install those programs what the emacs wrapper uses
```bash
wget https://cs.symfony.com/download/php-cs-fixer-v3.phar -O php-cs-fixer 
sudo chmod a+x php-cs-fixer 
sudo mv php-cs-fixer /usr/bin/php-cs-fixer 
curl -LsSf https://astral.sh/ruff/install.sh | sh
sudo npm i -g prettier
rustup update
git clone https://github.com/rust-analyzer/rust-analyzer.git -b release
cd rust-analyzer
cargo xtask install --server 
```
