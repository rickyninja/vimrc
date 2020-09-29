# Installing
git clone https://github.com/rickyninja/vimrc ~/.vim  
ln -s ~/.vim/vimrc ~/.vimrc  
cd ~/.vim  
git submodule update --init --recursive

Add `$HOME/.vim/scripts` to your PATH so external scripts work.
```
if [ -d $HOME/.vim/scripts ]; then
    PATH="$PATH:$HOME/.vim/scripts"
fi
export PATH
```
