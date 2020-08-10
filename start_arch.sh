#! /bin/bash
sudo pacman -S binutils make gcc fakeroot
echo "Building Fulton's config"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -S - < pkglist.txt --needed
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
sudo systemctl enable ly.service
cp .zshrc ~/.zshrc
cd $HOME
git clone https://github.com/adi1090x/dynamic-wallpaper.git
cd dynamic-wallpaper
chmod +x install.sh
./install.sh
cd $HOME/.config/polybar
cp -r fonts/* ~/.local/share/fonts
fc-cache -v
