#-----------------------------------------------------------
# Dotfiles [.bashrc, .tmux.conf, .vimrc]
# I'm trying neovim with NVChad. Keep the vim stuff in case.
#-----------------------------------------------------------

mv ~/.bashrc ~/.old_bashrc
mv .bashrc ~/.bashrc
# mv .vimrc ~/.vimrc
mv .tmux.conf ~/.tmux.conf

source ~/.bashrc

#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#vim -c PlugInstall
