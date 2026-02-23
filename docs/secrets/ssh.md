# SSH key management on a new machine

## Generate new keypair

`ssh-keygen -t ed25519 -C "yiheng.he@proton.me"`

## Backup private key

In KeePassXC, backup `~/.ssh/id_ed25519` with an attachment not an external file

## Upload public key

- Github: https://github.com/settings/keys

### To a remote server

`ssh-copy-id -i ~/.ssh/id_ed25519.pub user@host`

If the server only has SSH key authentication, then you can run the command from a machine with existing access with the new machine's public key.
