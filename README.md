![.dotfiles banner](/.assets/banner.png?raw=true "Github Banner")

## Installing
Install Homebrew:

    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Install Homebrew formulae from the `Brewfile`:

    brew bundle

Symlink dotfiles:

    rcup -v -x README.md -x Brewfile
