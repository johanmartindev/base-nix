# Nix environment
## Resources
* Nix
  * [Nix official site](https://nixos.org/)
  * [Nix manual](https://nix.dev/manual/nix/2.30/introduction.html)
  * [Nix.dev](https://nix.dev/)
  * [Flakes](https://nix.dev/concepts/flakes.html)
* Flakes
  * [Nix Flakes: the future of Nix](https://nixos.wiki/wiki/Flakes)
  * [Flakes: Nix’s new package management system](https://nixos.wiki/wiki/Flakes)
  * Docs
    * [Setting up a Nix development environment with Flakes and Direnv](https://sethaalexander.com/setting-up-a-nix-development-environment-with-flakes-and-direnv/)
* [Direnv](https://direnv.net/)

## Instructions
### Nix
* Install nix using the [official guide](https://nixos.org/download.html).
* Update `/etc/nix/nix.conf` to enable flakes and experimental features (see Configuration below).
#### Configuration
* /etc/nix/nix.conf
```
fallback = true
experimental-features = nix-command flakes
build-users-group = nixbld
trusted-users = root johanmartin
auto-optimise-store = true
system = "aarch64-darwin"
accept-flake-config = true
max-jobs = 4
```
### Direnv
* Install direnv (`brew install direnv` or `sudo port install direnv`).
  * Add `eval "$(direnv hook zsh)"` to your `~/.zshrc` file (or the equivalent for your shell).
  * Update/create ~/.config/direnv/direnvrc to include the use_flake function (see below).
  ```
  use_flake() {
    watch_file flake.nix
    watch_file flake.lock
    eval "$(nix print-dev-env)"
  }
  ```
## Editor integrations
### VS Code
* [Nix IDE](https://marketplace.visualstudio.com/items?itemName=jnoortheen.nix-ide)

## Package Search
* [Nix Packages Search](https://search.nixos.org/packages)
