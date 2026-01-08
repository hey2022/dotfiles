# Patching

## Patch nixpkgs or home-manager

Add the patch to the [patch module](../lib/patch/default.nix), it will automatically apply the patches to nixpkgs and home-manager.

## Overriding inputs when developing

Flake inputs can be overridden without updating flake.lock with the flag
`--override-input input /path/to/input`
