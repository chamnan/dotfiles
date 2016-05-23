This is my VIM configuration for Ubuntu

Installation/Configuring
------------------------
Paste the following into the Terminal.

The Ubuntu basic dependencies:

```
sudo apt-get install git-core curl zsh vim xclip 
```

####Install:

```
curl -k -L https://raw.github.com/chamnan/dotfiles/master/install.sh | sh

# Bundle Installation
vim +BundleInstall +qall
```
####Configuring:
To set zsh as your default shell
```
chsh -s /bin/zsh
```
To switch between **zsh** and **bash**
```
exec bash
exec zsh
```
- Font patching:
	1. Download the font of your choice from [powerline-fonts](https://github.com/Lokaltog/powerline-fonts).
	2. Move your patched font to `~/.fonts/`
	3. Run `fc-cache -vf ~/.fonts` to update your font cache

	For more info about Powerline [Font patching](https://powerline.readthedocs.org/en/latest/fontpatching.html)

![VIM](https://raw.github.com/chamnan/dotfiles/master/screenshot/VIM.png)
