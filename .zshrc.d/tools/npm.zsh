export NPM_GLOBAL_DIR="$HOME/.npm-global"
[[ -d "$NPM_GLOBAL_DIR" ]] || mkdir -p "$NPM_GLOBAL_DIR"

export NPM_CONFIG_PREFIX="$NPM_GLOBAL_DIR"
export PATH="$NPM_GLOBAL_DIR/bin:$PATH"
