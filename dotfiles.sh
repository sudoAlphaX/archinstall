# Clone dotfiles repo
git clone --recursive https://github.com/sudoAlphaX/dotfiles ~/.dotfiles

mkdir -v -p ~/.config
touch ~/.config/tmp

mkdir -v -p ~/.local/bin/
touch ~/.local/bin/tmp

mkdir -v -p ~/Pictures/
mkdir -v -p ~/Pictures/Screenshots/
touch ~/Pictures/tmp
mkdir -v -p ~/Videos/wf-recorder/

mkdir -v -p ~/WIP/
mkdir -v -p ~/repos/

mkdir -p -v .local/state/zsh/

cd ~/.dotfiles || (
  echo -e "Failed to cd into ~/.dotfiles"
  exit 1
)
stow -v .
cd ~ || (
  echo -e "Failed to cd into ~"
  exit 1
)

rm -v ~/.config/tmp
rm -v ~/.local/bin/tmp
rm -v ~/Pictures/tmp

# Install fonts
mkdir -p ~/.local/share/fonts
cp ~/.dotfiles/.config/rofi/assets/rofi-git/fonts/* ~/.local/share/fonts/
