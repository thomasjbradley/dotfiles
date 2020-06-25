# Re-add all the known SSH keys
ssh-add -A

# Load ~/.bash_prompt, ~/.exports, ~/.aliases, ~/.functions and ~/.extra
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{bash_prompt,exports,aliases,functions,extra}; do
  [ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Prefer US English and use UTF-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2)" scp sftp ssh

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Finder Dock Mail Safari iTunes iCal Address\ Book SystemUIServer" killall

# Switch to newer bash completion installed with Homebrew
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Set up Vi key bindings
set -o vi

# Setup tab completions for homebrew
# brew install bash-completion
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi


# Set up git completions
if [ -f ~/dotfiles/.git-completion ]; then
  . ~/dotfiles/.git-completion
fi

# Use Git’s colored diff when available
hash git &>/dev/null
if [ $? -eq 0 ]; then
  function diff() {
    git diff --no-index --color-words "$@"
  }
fi

# Set up direnv - directory custom env vars
eval "$(direnv hook bash)"

# Set up NPM completion
. <(npm completion)

# This is a modified version of the script generated by https://docs.npmjs.com/cli/completion to include `npm install` autocompletion.
# Basically we added `if` blocks to check for `install` subcommand.

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#
# for BASH
if type complete &>/dev/null; then
    _npm_completion () {
        local words cword
        if type _get_comp_words_by_ref &>/dev/null; then
            _get_comp_words_by_ref -n = -n @ -w words -i cword
        else
            cword="$COMP_CWORD"
            words=("${COMP_WORDS[@]}")
        fi

        local si="$IFS"


        # if your npm command includes `install` or `i `
        if [[ ${words[@]} =~ 'install' ]] || [[ ${words[@]} =~ 'i ' ]]; then
            local cur=${COMP_WORDS[COMP_CWORD]}

            # supply autocomplete words from `~/.npm`, with $cur being value of current expansion like 'expre'
            COMPREPLY=( $( compgen -W "$(ls ~/.npm )" -- $cur ) )
        else
            IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                COMP_LINE="$COMP_LINE" \
                COMP_POINT="$COMP_POINT" \
                npm completion -- "${words[@]}" \
                2>/dev/null)) || return $?
        fi

        IFS="$si"
    }
    complete -o default -F _npm_completion npm
# for ZSH
elif type compdef &>/dev/null; then
    _npm_completion() {
        local si=$IFS


        # if your npm command includes `install`
        if [[ ${words} =~ 'install' ]] || [[ ${words} =~ 'i ' ]]; then
            compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                COMP_LINE=$BUFFER \
                COMP_POINT=0 \
                ls ~/.npm -- "${words[@]}" \
                2>/dev/null)

        else
            compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                COMP_LINE=$BUFFER \
                COMP_POINT=0 \
                npm completion -- "${words[@]}" \
                2>/dev/null)
        fi

        IFS=$si
    }
    compdef _npm_completion npm
elif type compctl &>/dev/null; then

    _npm_completion () {
        local cword line point words si
        read -Ac words
        read -cn cword
        let cword-=1
        read -l line
        read -ln point
        si="$IFS"
        IFS=$'\n' reply=($(COMP_CWORD="$cword" \
            COMP_LINE="$line" \
            COMP_POINT="$point" \
            npm completion -- "${words[@]}" \
            2>/dev/null)) || return $?
        IFS="$si"
    }
    compctl -K _npm_completion npm
fi
###-end-npm-completion-###

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

eval "$(pipenv --completion)"

eval "$(rbenv init -)"

eval "$(pyenv init -)"
