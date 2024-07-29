mv ~/.bashrc ~/.old_bashrc
mv .bashrc ~/.bashrc
mv .vimrc ~/.vimrc
mv .tmux.conf ~/.tmux.conf

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -c PlugInstall


