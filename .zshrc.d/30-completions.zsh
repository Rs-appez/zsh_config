typeset -A completion_tools
completion_tools=(
    [ng]="completion script"
    [just]="--completions zsh"
    [fx]="--comp zsh"
    [uv]="generate-shell-completion zsh"
)

typeset -A init_tools
init_tools=(
    [fzf]="--zsh"
    [zoxide]="init zsh"
)

typeset -A prompt_tools
prompt_tools=(
    [starship]="init zsh"
)

update_completions() {
    echo "Regenerating static completions..."

    completion_dir="$HOME/.zshrc.d/completions"
    if [[ ! -d "$completion_dir" ]]; then
        mkdir -p "$completion_dir"
    fi
    for tool args in ${(kv)completion_tools}; do
        if command -v $tool >/dev/null; then
            $tool $=args > "$completion_dir/${tool}.zsh"
            echo "  - Updated $tool"
        else
            echo "  - Skipped $tool (not installed)"
        fi
    done

    init_dir="$HOME/.zshrc.d/inits"
    if [[ ! -d "$init_dir" ]]; then
        mkdir -p "$init_dir"
    fi
    for tool args in ${(kv)init_tools}; do
        if command -v $tool >/dev/null; then
            $tool $=args > "$init_dir/${tool}.zsh"
            echo "  - Updated init script: $tool"
        fi
    done
    for tool args in ${(kv)prompt_tools}; do
        if command -v $tool >/dev/null; then
            $tool $=args > "$init_dir/99-${tool}.zsh"
            echo "  - Updated prompt: $tool"
        fi
    done

    rm -f ~/.zcompdump
    autoload -Uz compinit
    compinit -C
    echo "Completions updated successfully!"
}
