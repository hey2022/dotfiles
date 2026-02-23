# GPG key management

## Import key

Get `private.gpg` from KeePassXC backup an run:

`gpg --import private.gpg`

## Backup key

Whenever the key is modified a backup is required

```
gpg --list-keys
gpg --export-secret-keys KEYID > private.gpg
```

Save this file as an attachment in KeePassXC

## Removing primary key

**BACKUP FIRST**

**BACKUP FIRST**

**BACKUP FIRST**

Find the remove the primary secret key

```
gpg --with-keygrip --list-keys
rm ~/.gnupg/private-keys-v1.d/KEYGRIP.key
```

## Uploading GPG key

Upload output of:

```
gpg --list-keys
gpg --armor --export KEYID
```

## Renew key

Find and edit the key with:

```
gpg --list-keys
gpg --edit-key KEYID
```

Then, In the gpg console extend the key expiration

```
gpg> key INDEX
gpg> expire
gpg> save
```
