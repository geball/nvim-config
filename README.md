# nvim-config

This repo contains my Neovim config, which has been adapted / inspired largely from the work of:

- [TJ DeVries](https://github.com/tjdevries/config_manager)
- [Josean Martinez](https://github.com/josean-dev/dev-environment-files)

## Getting started

Rather than using this repo as-is, I'd suggest using bits and pieces as needed. That said, this repo should work as-is on Mac or Linux (other than the Homebrew comment below). If you're using Windows, you'd need to modify where your nvim config goes.

1. Install the latest stable build of [Neovim](https://github.com/neovim/neovim) (I use Homebrew on Mac, but installing from source will work as well).
2. Backup `~/.config/nvim` and then delete the directory.
3. In your terminal, you can either:
   a. Run `nvim --headless "+Lazy! sync" +qa` to get everything set up, or
   b. Open Neovim (`nvim`), let the package manager install everything, and then quit.
4. In either case, Neovim will now be ready to go, and can be started by running `nvim`.
