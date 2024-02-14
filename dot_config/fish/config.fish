if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr -a rm trash-put
    abbr -a venv-activate "source ./venv/bin/activate.fish"
    abbr -a cd z
    zoxide init fish | source
    thefuck --alias | source
end
