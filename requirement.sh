#!/bin/bash

sudo apt-get install clang-format -y
sudo apt-get install clangd php-cli  -y 
wget https://cs.symfony.com/download/php-cs-fixer-v3.phar -O php-cs-fixer 
sudo chmod a+x php-cs-fixer 
sudo mv php-cs-fixer /usr/bin/php-cs-fixer
sudo  curl -Lo phpactor.phar https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar
sudo chmod +x  phpactor.phar
sudo mv phpactor.phar /usr/bin/phpactor
curl -LsSf https://astral.sh/ruff/install.sh | sh
sudo npm i -g prettier


echo "...install rust"
curl https://sh.rustup.rs -sSf | sh -s -- -y
echo "...update rust"
rustup update
git clone https://github.com/rust-analyzer/rust-analyzer.git 
cd rust-analyzer
cargo xtask install --server 

sudo npm i -g prettier 
