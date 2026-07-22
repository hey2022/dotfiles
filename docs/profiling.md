# Profiling Nix

Nix evaluation time is abysmal.
Profiling can help see which parts are causing the most slowdowns.

## CI profiler

```
nix eval --no-eval-cache --eval-profiler flamegraph .#checks
```

## NixOS system profiler

```
nix eval --no-eval-cache --eval-profiler flamegraph .#nixosConfigurations.$(hostname).config.system.build.toplevel
```

## Home-manager profiler

```
nix eval --no-eval-cache --eval-profiler flamegraph .#homeConfigurations.$(whoami)@$(hostname).activationPackage
```

## Flamegraph visualizer

https://www.speedscope.app
