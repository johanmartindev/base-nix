# Nix environment
## Resources
* [Setting up a Nix development environment with Flakes and Direnv](https://sethaalexander.com/setting-up-a-nix-development-environment-with-flakes-and-direnv/)
## Instructions
* Install nix using the [official guide](https://nixos.org/download.html).
* Allow experimental features by adding the following lines to your `~/.config/nix/nix.conf` file:
```
* Install direnv (brew install direnv or sudo port install direnv)
* Add `eval "$(direnv hook zsh)"` to your `~/.zshrc` file (or the equivalent for your shell).
* Configure your direnvc file
  * add to ~/.config/direnv/direnvrc:
```
use_flake() {
  watch_file flake.nix
  watch_file flake.lock
  eval "$(nix print-dev-env)"
}
```
## Resources
### VS Code
* [Nix IDE](https://marketplace.visualstudio.com/items?itemName=jnoortheen.nix-ide)
