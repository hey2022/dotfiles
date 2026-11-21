# Environment

- Run project commands directly if `DIRENV_DIR` (without its leading `-`) matches the project root or the user confirms the project's dev shell is active.
- Otherwise, use `DIRENV_LOG_FORMAT='' direnv exec . <cmd>` when the project has an approved `.envrc`.
- If neither applies and the project has a flake dev shell, use `nix develop -c <cmd>` from the flake root.
- For other missing tools, use `nix shell nixpkgs#<pkg> -c <cmd>`. If a task needs multiple packages, pass each as a separate `nixpkgs#<pkg>` argument before `-c`.
- When several related commands need the same Nix environment, run them in a single `nix develop` or `nix shell` invocation.
- If Nix fails with `Read-only file system` while writing to its user cache (usually `~/.cache/nix`), retry once with `XDG_CACHE_HOME="$(mktemp -d)"` set for that command.
- If the package is unknown, use `nix-locate --minimal --at-root --whole-name /bin/<cmd>` to find it.
- For temporary standalone Python scripts, use `uv run --no-project --with <pkg> python script.py` (prefix with `nix shell nixpkgs#uv -c` if unavailable).
