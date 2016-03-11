# install Vundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install ctag for tagbar
sudo apt-get install ctags

# install YouCompleteMe
sudo apt-get install cmake make gcc g++ libc-dev python-dev
~/.vim/bundle/YouCompleteMe/install.py
# C-family support: add --clang-completer to ./install.py
# C# support: add --omnisharp-completer to ./install.py
# Go support: ensure go is installed and add --gocode-completer
# TypeScript support: install nodejs and npm then install the TypeScript SDK with npm install -g typescript.
# JavaScript support: install nodejs and npm and add --tern-completer to ./install.py
# Rust support: install rustc and cargo and add --racer-completer to ./install.py

# move snippets position for ultisnips
sudo rm -rf ~/.vim/UltiSnips/
sudo ln -s ~/.vim/bundle/vim-snippets/UltiSnips ~/.vim/UltiSnips
