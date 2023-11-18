abbr -a dc cd
abbr -a vi nvim
abbr -a vim nvim
abbr -a gs 'git status'
abbr -a gc 'git checkout'
abbr -a vimdiff 'nvim -d'
abbr -a ibrew 'arch --x86_64 /usr/local/Homebrew/bin/brew'

if status --is-interactive
	if test -d ~/dev/others/base16/templates/fish-shell
		set fish_function_path $fish_function_path ~/dev/others/base16/templates/fish-shell/functions
		builtin source ~/dev/others/base16/templates/fish-shell/conf.d/base16.fish
	end
end

if command -v eza > /dev/null
	abbr -a l 'eza'
	abbr -a ls 'eza --color=auto'
	abbr -a la 'eza -a'
	abbr -a ll 'eza -lah'
else
	abbr -a l 'ls'
	abbr -a la 'ls -a'
	abbr -a ll 'ls -la'
end

if command -v rg > /dev/null
    abbr -a grep 'rg --line-buffered'
end

if command -v bat > /dev/null
	abbr -a cat 'bat -p'
end

if command -v et > /dev/null
	abbr -a tree 'et -I'
end

if test -f /usr/share/autojump/autojump.fish;
	source /usr/share/autojump/autojump.fish;
end

function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t -- $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -f backward-delete-char history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

# Fish git prompt
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate ''
set __fish_git_prompt_showupstream 'none'
set -g fish_prompt_pwd_dir_length 3

# colored man output
# from http://linuxtidbits.wordpress.com/2009/03/23/less-colors-for-man-pages/
setenv LESS_TERMCAP_mb \e'[01;31m'       # begin blinking
setenv LESS_TERMCAP_md \e'[01;38;5;74m'  # begin bold
setenv LESS_TERMCAP_me \e'[0m'           # end mode
setenv LESS_TERMCAP_se \e'[0m'           # end standout-mode
setenv LESS_TERMCAP_so \e'[38;5;246m'    # begin standout-mode - info box
setenv LESS_TERMCAP_ue \e'[0m'           # end underline
setenv LESS_TERMCAP_us \e'[04;38;5;146m' # begin underline

setenv FZF_DEFAULT_COMMAND 'fd --type file --follow'
setenv FZF_CTRL_T_COMMAND 'fd --type file --follow'
setenv FZF_DEFAULT_OPTS '--height 20%'

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar

    bind \cz 'fg>/dev/null ^/dev/null'
    if functions -q fzf_key_bindings
       fzf_key_bindings
    end
end

function fish_prompt
#set_color brblack
#echo -n "["(date "+%H:%M")"] "
	set_color blue
	echo -n (hostname)
	if [ $PWD != $HOME ]
		set_color brblack
		echo -n ':'
		set_color yellow
		echo -n (basename $PWD)
	end
	set_color green
	printf '%s ' (__fish_git_prompt)
	set_color red
	echo -n '| '
	set_color normal
end

function fish_greeting
    neofetch
end

source /Users/tlaurens/.docker/init-fish.sh || true # Added by Docker Desktop
