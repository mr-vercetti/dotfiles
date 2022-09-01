#!/bin/bash
# Script installing oh-my-bash and dotfiles

print_usage () {
   echo "Usage: "$0" [options...]"
   echo "-f     Install Powerline fonts"
}

while getopts "fh" opt
do
   case $opt in
      f)
         install_fonts="yes";;
      h)
         print_usage
         exit 3
         ;;
   esac
done

# Variables
script_dir="$(cd "$(dirname ${BASH_SOURCE[0]})" && pwd)"

home_dir=$HOME

old_dotfiles_dir="${home_dir}/old-dotfiles"

dotfiles=(bashrc vimrc)


# Install powerline fonts (for native Linux installation)
if [[ $install_fonts == "yes" ]]; then
   echo "Installing powerline fonts..."
   cd $script_dir
   git clone https://github.com/powerline/fonts.git --depth=1
   cd fonts
   ./install.sh
   cd ..
   rm -rf fonts
fi

# Install oh-my-bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

# Create backup of current dotfiles, then create symlinks for new ones
mkdir -p $old_dotfiles_dir

for dotfile in ${dotfiles[@]}; do
   mv ${home_dir}/.${dotfile} $old_dotfiles_dir
   echo "Moving old [.${dotfile}] to [$old_dotfiles_dir]..."
   ln -s ${script_dir}/${dotfile} ${home_dir}/.${dotfile}
   echo "Creating symlink for [.${dotfile}]..."
done

echo "You're ready."
