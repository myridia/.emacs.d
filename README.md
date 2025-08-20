# .emacs.d

## Emacs configuration to work with
* Rust
* Python
* PHP
* JavaScript
* Go
* AHK
* Kotlin

## Requirements 
* Install those programs what the emacs wrapper uses
```bash
sudo apt-get install libssl-dev pkg-config
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
wget https://cs.symfony.com/download/php-cs-fixer-v3.phar -O php-cs-fixer 
sudo chmod a+x php-cs-fixer 
sudo mv php-cs-fixer /usr/bin/php-cs-fixer
sudo  curl -Lo phpactor.phar https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar
sudo chmod +x  phpactor.phar
sudo mv phpactor.phar /usr/bin/phpactor
curl -LsSf https://astral.sh/ruff/install.sh | sh
sudo npm i -g prettier
rustup update
git clone https://github.com/rust-analyzer/rust-analyzer.git -b release
cd rust-analyzer
cargo xtask install --server 
```
