if not functions -q fisher
    set FISHER_VERSION "3.2.7"
    set FISHER_CHECKSUM "7d7ec9edc9b3ef0c610db8eeb153995633fb07a8"

    set FISHER_URL "https://raw.githubusercontent.com/jorgebucaran/fisher/$FISHER_VERSION/fisher.fish"
    set REMOTE_CHECKSUM (curl -Lks $FISHER_URL | shasum | awk '{print $1}')

    if [ $FISHER_CHECKSUM != $REMOTE_CHECKSUM ]
        echo "Fisher install failed, checksums don't match"
    else
        echo "Downloading fisher..."
        set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME $HOME/.config
        curl $FISHER_URL --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
        fish -c fisher
    end
end

set -x LANG en_US.UTF-8
set -x LANGUAGE en_US.UTF-8
set -x LC_ALL en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

set -g theme_display_date no

eval (python -m virtualfish)
set fish_greeting ""
