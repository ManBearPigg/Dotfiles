#-----------------------------------------------------------
# Dotfiles [.bashrc, .tmux.conf, .vimrc]
# I'm trying neovim with NVChad. Keep the vim stuff in case.
#-----------------------------------------------------------

mv ~/.bashrc ~/.old_bashrc
mv "$(dirname "$0")/.bashrc" ~/.bashrc
#mv "$(dirname "$0")/.vimrc" ~/.vimrc
mv "$(dirname "$0")/.tmux.conf" ~/.tmux.conf

source ~/.bashrc

#curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#vim -c PlugInstall
