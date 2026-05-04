# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

Personal dotfiles. Files here are not used in place — the `install` script symlinks them into `$HOME` and `$HOME/.config/`. Editing a file in this repo is editing the live config, because the destinations are symlinks back here.

## Install / re-link

```sh
./install
```

Idempotent: re-run after adding new top-level configs that need symlinking. Only files explicitly handled in `install` are linked — adding a new dotfile is a two-step change (drop the file, then add an `ln -sf` line).

## Layout & how things wire together

- `zshrc` → sources `oh-my-zsh`, then iterates `zsh/*.zsh` and sources every file. Adding a new `zsh/foo.zsh` requires no registration. `~/.zshrc.local` is sourced last for machine-specific overrides (created empty by `install`).
- `init.lua` (Neovim entry) sets leader keys, enables LSPs from `lsp/*.lua` via `vim.lsp.enable`, and `require`s the modules in `lua/` in a fixed order: `plugins`, `options`, `mappings`, `autocmd`, `rename`, `spec`. Plugins are managed by `lazy.nvim` (bootstrapped on first run inside `lua/plugins.lua`).
- `init.min.lua` is a standalone, plugin-free fallback config — keep it self-contained; do not `require` from `lua/`.
- `lsp/*.lua` files are auto-discovered by Neovim's native `vim.lsp.config` mechanism (filename = server name). To add a server, drop a file here and add its name to the `vim.lsp.enable { ... }` list in `init.lua`.
- `mise.config.toml` → linked to `~/.config/mise/config.toml`. Tool versions for project work generally come from per-project `.tool-versions` / idiomatic version files; this file mainly sets node and enables idiomatic version files for python/ruby/node.

## Notable Neovim wiring

- `lua/spec.lua` runs RSpec / Playwright tests by shelling out to `wezterm cli send-text` into the *next* pane in the current Wezterm tab (mappings: `<leader>s{a,f,n,l}` for rspec, `<leader>p{a,f,n,l}` for playwright — all/file/nearest/last). It depends on the `WEZTERM_PANE` env var, so it only works when nvim is launched from inside Wezterm.
- `lua/autocmd.lua` has project-specific `BufWritePost` hooks: writing `messages/**/*.yml` runs `npm run messages`, writing `config/locales/gamma.en.yml` runs `bin/rake codegen:translations`. These fire silently in any repo that matches those paths — be aware when editing if a no-op job spawns.
- LSP keymaps are set inside an `LspAttach` autocmd (also in `autocmd.lua`) and use `,` (comma) as the prefix, distinct from the `<leader>` (space) mappings everywhere else.
- Formatting is via `conform.nvim` with `format_on_save` enabled (`lsp_format = 'fallback'`). Per-language formatters are in `lua/plugins.lua`.

## Style

- Lua: stylua, configured by `.stylua.toml` (2-space indent, single quotes preferred, 120 cols, no parens on single-arg calls). Run `stylua .` before committing Lua changes.
- Keep changes minimal and match surrounding style — these are personal configs; consistency matters more than convention.
