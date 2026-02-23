# SOPS key management on a new machine

## Admin key

Deploy the admin key from KeePassXC to `~/.config/sops/age/keys.txt`

```
mkdir -p ~/.config/sops/age
nvim ~/.config/sops/age/keys.txt
```

## User key

Generate a new age key for the user:

```
age-keygen >> ~/.config/sops/age/keys.txt
```

Backup this key into KeePassXC then add the public key into `.sops.yaml`

## Root key

Generate an age public key from ssh and add it to `.sops.yaml`

```
nix shell nixpkgs#ssh-to-age --command sh -c "cat /etc/ssh/ssh_host_ed25519_key.pub | ssh-to-age"
```

## Update SOPS files with new keys

Run in project root:

```
fd . --type file secrets -x sops updatekeys --yes
```
