export XDG_CACHE_HOME="$HOME"/.cache
export XDG_CONFIG_HOME="$HOME"/.config
export XDG_DATA_HOME="$HOME"/.local/share
export XDG_STATE_HOME="$HOME"/.local/state

export ASDF_CONFIG_FILE="$XDG_CONFIG_HOME"/asdf/asdfrc
export ASDF_DATA_DIR="$XDG_DATA_HOME"/asdf
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export HISTFILE="$XDG_STATE_HOME"/history
export ICEAUTHORITY="$XDG_CACHE_HOME"/ICEauthority
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export MPLAYER_HOME="$XDG_CONFIG_HOME"/mplayer
export MYSQL_HISTFILE="$XDG_STATE_HOME"/mysql_history
export NPM_CONFIG_PREFIX="$HOME"/.local/lib/node_modules
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/config
export NPM_CONFIG_CACHE="$XDG_CACHE_HOME"/npm
# export NPM_CONFIG_TMP="$XDG_RUNTIME_DIR"/npm
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/startup.py
export SOLARGRAPH_CACHE="$XDG_CACHE_HOME"/solargraph
export SQLITE_HISTORY="$XDG_STATE_HOME"/sqlite_history
export WGETRC="$XDG_CONFIG_HOME"/wgetrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

alias dosbox="dosbox -conf $XDG_CONFIG_HOME/dosbox/dosbox.conf"
alias nvidia-settings="nvidia-settings --config=$XDG_CONFIG_HOME/nvidia/settings"
alias pidgin="pidgin --config=$XDG_DATA_HOME/purple"

