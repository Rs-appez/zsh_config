ZDOTDIR_EXT="$HOME/.zshrc.d"

if [[ -d "$ZDOTDIR_EXT" ]]; then
    for script in "$ZDOTDIR_EXT"/*.zsh(N); do
        source "$script"
    done
fi
if [[ -d "$ZDOTDIR_EXT/tools" ]]; then
    for script in "$ZDOTDIR_EXT"/tools/*.zsh(N); do
        source "$script"
    done
fi
if [[ -d "$ZDOTDIR_EXT/inits" ]]; then
    for script in "$ZDOTDIR_EXT"/inits/*.zsh(N); do
        source "$script"
    done
fi
