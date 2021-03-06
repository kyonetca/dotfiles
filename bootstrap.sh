#!/bin/bash

# -----------------------------------------------------------------------------
# bootstrap: quick and easy dotfiles setup
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# constants

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


# -----------------------------------------------------------------------------
# settings

name="Andy Weidenbaum"     # Name    (GitHub)
email="archbaum@gmail.com" # Email   (GitHub)
github="atweiden"          # Account (GitHub)
zipcode=97210              # Zipcode (f.lux)


# -----------------------------------------------------------------------------
# dirs

mkdir -p $HOME/.marks               \
         $HOME/.src                 \
         $HOME/Desktop              \
         $HOME/Documents            \
         $HOME/Downloads            \
         $HOME/Graphics             \
         $HOME/Music                \
         $HOME/Projects


# -----------------------------------------------------------------------------
# backup

for dotfile in $HOME/.ackrc          \
               $HOME/.bashrc         \
               $HOME/.bash_logout    \
               $HOME/.bash_profile   \
               $HOME/.bin            \
               $HOME/.codex          \
               $HOME/.config         \
               $HOME/.conkyrc        \
               $HOME/.conkyrc1       \
               $HOME/.ctags          \
               $HOME/.curlrc         \
               $HOME/.dir_colors     \
               $HOME/.dunstrc        \
               $HOME/.functions.d    \
               $HOME/.gemrc          \
               $HOME/.gitconfig      \
               $HOME/.gitignore      \
               $HOME/.gitattributes  \
               $HOME/.gtkrc-2.0.mine \
               $HOME/.gnupg          \
               $HOME/.hgext          \
               $HOME/.hgignore       \
               $HOME/.hgmap          \
               $HOME/.hgrc           \
               $HOME/.iex.exs        \
               $HOME/.inputrc        \
               $HOME/.jshintignore   \
               $HOME/.jshintrc       \
               $HOME/.keymap         \
               $HOME/.npmrc          \
               $HOME/.pdbrc          \
               $HOME/.psqlrc         \
               $HOME/.pythonrc       \
               $HOME/.screenrc       \
               $HOME/.tmux           \
               $HOME/.tmux.conf      \
               $HOME/.vim            \
               $HOME/.vimrc          \
               $HOME/.vimrc.lite     \
               $HOME/.vimshrc        \
               $HOME/.vimencrypt     \
               $HOME/.wgetrc         \
               $HOME/.Xdefaults      \
               $HOME/.Xmodmap        \
               $HOME/.xinitrc        \
               $HOME/.xsession; do
                                    echo "backing up ${dotfile} (if it exists)"
                                    if [[ -f "${dotfile}" || -d "${dotfile}" ]]; then
                                      mv "${dotfile}" "${dotfile}".bak
                                    fi
done


# -----------------------------------------------------------------------------
# links

for dotfolder in bin         \
                 config      \
                 functions.d \
                 gnupg       \
                 hgext       \
                 hgmap       \
                 ssh         \
                 tmux        \
                 vim; do cp -R "${DIR}/_${dotfolder}" "$HOME/.${dotfolder}"
done

for dotfile in ackrc          \
               bash_logout    \
               bash_profile   \
               bashrc         \
               codex          \
               conkyrc        \
               conkyrc1       \
               ctags          \
               curlrc         \
               dir_colors     \
               dunstrc        \
               gemrc          \
               gitattributes  \
               gitconfig      \
               gitignore      \
               gtkrc-2.0.mine \
               hgignore       \
               hgrc           \
               iex.exs        \
               inputrc        \
               jshintignore   \
               jshintrc       \
               keymap         \
               npmrc          \
               pdbrc          \
               psqlrc         \
               pythonrc       \
               screenrc       \
               tmux.conf      \
               vimencrypt     \
               vimrc          \
               vimrc.lite     \
               vimshrc        \
               wgetrc         \
               Xdefaults      \
               Xmodmap        \
               xinitrc        \
               xsession; do cp "$DIR/_${dotfile}" "$HOME/.${dotfile}"
done


# -----------------------------------------------------------------------------
# tmux
[[ -x /usr/bin/git ]] \
  && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm \
  && git clone https://github.com/tmux-plugins/tmux-copycat ~/.tmux/plugins/tmux-copycat \
  && git clone https://github.com/tmux-plugins/tmux-yank ~/.tmux/plugins/tmux-yank \
  && git clone https://github.com/tmux-plugins/tmux-logging ~/.tmux/plugins/tmux-logging \
  && git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/plugins/tmux-resurrect \
  && git clone https://github.com/tmux-plugins/tmux-sessionist ~/.tmux/plugins/tmux-sessionist


# -----------------------------------------------------------------------------
# github

sed -i "s#yourname#$name#"         $HOME/.gitconfig
sed -i "s#youremail#$email#"       $HOME/.gitconfig
sed -i "s#yourgithubacct#$github#" $HOME/.gitconfig
sed -i "s#yourname#$name#"         $HOME/.hgrc
sed -i "s#youremail#$email#"       $HOME/.hgrc


# -----------------------------------------------------------------------------
# f.lux

sed -i "s#97210#$zipcode#"         $HOME/.config/openbox/autostart.sh
