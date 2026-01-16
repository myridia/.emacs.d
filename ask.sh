#!/bin/bash




echo -e "What you like to do?, enter a Task Id from list below: \n"
echo -e "TaskID\tFile\t\tDescription"
echo -e "1\t X "
echo -e "2\t Install Rust Depencies "
echo -e "3\t Install Python Depencies "
echo -e "4\t Install PHP Depencies "
echo -e "5\t Stop Docker"



until [ "$task" = "0" ]; do 
read task
    
if [ "$task" = "1" ]; then
    echo "...${task}"

    
elif [ "$task" = "2" ]; then
    echo "...${task}"
    echo "...install rust"
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    echo "...update rust"
    rustup update
    git clone https://github.com/rust-analyzer/rust-analyzer.git 
    cd rust-analyzer
    cargo xtask install --server     
    
elif [ "$task" = "3" ]; then
    echo "...${task}"
    curl -LsSf https://astral.sh/ruff/install.sh | sh
    sudo npm i -g prettier 

elif [ "$task" = "4" ]; then
    echo "...${task}"
    sudo apt-get install clangd php-cli  -y 
    wget https://cs.symfony.com/download/php-cs-fixer-v3.phar -O php-cs-fixer 
    sudo chmod a+x php-cs-fixer 
    sudo mv php-cs-fixer /usr/bin/php-cs-fixer
    sudo  curl -Lo phpactor.phar https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar
    sudo chmod +x  phpactor.phar
    sudo mv phpactor.phar /usr/bin/phpactor
    

    
else
    echo "Goodbye! - Exit"
fi

sleep 3

./ask.sh

done 
