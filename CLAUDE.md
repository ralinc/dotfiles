# CLAUDE.md

## Repository purpose

Personal dotfiles. Files here are not used in place: the `install` script symlinks them into `$HOME` and `$HOME/.config/`. Editing a file in this repo is editing the live config, because the destinations are symlinks back here.

## Install / re-link

```sh
./install
```

Idempotent: re-run after adding new top-level configs that need symlinking. Only files explicitly handled in `install` are linked, so adding a new dotfile is a two-step change (drop the file, then add an `ln -sf` line).

## Layout & how things wire together

- `init.min.lua` is the plugin-free core: options, mappings and autocmds. `init.lua` runs it first, then loads plugins and the `lua/` modules that depend on them. Keep it self-contained; do not `require` from `lua/`. A setting that needs no plugin belongs here, not in `lua/`.
- `lsp/*.lua` files are auto-discovered by Neovim's native `vim.lsp.config` mechanism (filename = server name). To add a server, drop a file here and add its name to the `vim.lsp.enable { ... }` list in `init.lua`.
- `lazy-lock.json` is tracked here and linked into `~/.config/nvim`, so plugin versions follow the repo.

## Notable Neovim wiring

- `lua/spec.lua` runs RSpec / Playwright tests by sending the command with `cmux send` to the next cmux pane (mappings: `<leader>s{a,f,n,l}` for rspec, `<leader>p{a,f,n,l}` for playwright: all/file/nearest/last). It reads `CMUX_SURFACE_ID`, so it only works when nvim runs inside cmux.
- `lua/autocmd.lua` has project-specific `BufWritePost` hooks: writing `messages/**/*.yml` runs `npm run messages`, writing `config/locales/gamma.en.yml` runs `bin/rake codegen:translations`. These fire silently in any repo that matches those paths, so expect a stray job if you edit such a file elsewhere.

## Style

- Lua: stylua, configured by `.stylua.toml`. Run `stylua .` before committing Lua changes.
- Keep changes minimal and match surrounding style. These are personal configs; consistency matters more than convention.
- Commit messages are a subject line only, never a body. This overrides the body rules in the `commit-message` skill; its subject rules still apply.
