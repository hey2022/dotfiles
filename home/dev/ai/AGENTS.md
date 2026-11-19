# Environment

- Prefer tools already available on `PATH`.
- For missing commands, use `nix shell nixpkgs#<pkg> -c <cmd>`.
- If the package is unknown, use `nix-locate --minimal --at-root --whole-name /bin/<cmd>` to find it.
- For temporary standalone Python scripts, use `uv run --no-project --with <pkg> python script.py` (prefix with `nix shell nixpkgs#uv -c` if unavailable).
