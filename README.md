## Install Vundle

``
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstall +qall
``


## compile You complete

    sudo apt-get update && sudo apt-get install build-essential
    sudo apt-get -y install python-dev
    cd ~/.vim/bundle/YouCompleteMe && ./install.py --clang-completer

if virtual memory exhaused
  sudo fallocate -l 2G /swapfile
  ls /swapfile
  sudo chmod 600 /swapfile
  sudo mkswap /swapfile
  sudo swapon /swapfile

and try again.
