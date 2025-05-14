# emacs_starter
Our Emacs configuration to have always ready all development tools to work with emacs 

## Description 
* My emacs settings, so i have the all the extra installed and setup for my development

## All Requirements 
* Install those programs what the emacs wrapper uses
```bash
wget https://cs.symfony.com/download/php-cs-fixer-v3.phar -O php-cs-fixer 
sudo chmod a+x php-cs-fixer 
sudo mv php-cs-fixer /usr/bin/php-cs-fixer 
curl -LsSf https://astral.sh/ruff/install.sh | sh
sudo npm i -g prettier
git clone https://github.com/rust-analyzer/rust-analyzer.git -b release
cd rust-analyzer
cargo xtask install --server # will install rust-analyzer into $HOME/.cargo/bin
```
