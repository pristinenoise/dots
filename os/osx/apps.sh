#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
  qlcolorcode
  appcleaner
  qlmarkdown
  seil
  vagrant
  flash
  iterm2
  qlprettypatch
  shiori
  sublime-text3
  virtualbox
  flux
  qlstephen
  sketch
  vlc
  cloudup
  font-m-plus
  nvalt
  quicklook-json
  skype
  transmission
  apikitchen
  mamp
    onepassword
  airserver
  atext
  adium
  adobe-air
  adobe-creative-cloud
  appcleaner
  audacity
  audio-hijack-pro
  byword
  calibre
  cleanmymac
  codekit
  colloquy
  divvy
  dropbox
  filezilla
  firefox
  flux
  handbrake
  handbrakecli
  iterm2
  launchbar
  macvim
  mp4tools
  mplayerx
  mumble
  omnifocus
  pixelmator
  simple-comic
  sketch
  sublime-text3
  spotify
  steam
  spotify-menubar
  transmission
  vlc
  xscope
)

# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
)

# Specify the location of the apps
appdir="/Applications"

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

main() {

  # Ensure homebrew is installed
  homebrew

  # Install homebrew-cask
  echo "installing cask..."
  brew tap phinze/homebrew-cask
  brew install brew-cask

  # Tap alternative versions
  brew tap caskroom/versions

  # Tap the fonts
  brew tap caskroom/fonts

  # install apps
  echo "installing apps..."
  brew cask install --appdir=$appdir ${apps[@]}

  # install fonts
  echo "installing fonts..."
  brew cask install ${fonts[@]}

  # link with alfred
  brew cask launchbar link
  cleanup
}

homebrew() {
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}


cleanup() {
  brew cleanup
}

main "$@"
exit 0
