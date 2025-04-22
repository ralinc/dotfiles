return {
  cmd = { 'vscode-eslint-language-server', '--stdio' },
  filetypes = { 'typescript', 'typescriptreact' },
  root_markers = { 'eslint.config.js', 'tsconfig.json', 'package.json' },
  settings = {
    validate = 'on',
    packageManager = nil,
    useESLintClass = false,
    experimental = {
      useFlatConfig = true,
    },
    codeActionOnSave = {
      enable = false,
      mode = 'all',
    },
    format = false,
    quiet = false,
    onIgnoredFiles = 'off',
    rulesCustomizations = {},
    run = 'onType',
    problems = {
      shortenToSingleLine = false,
    },
    nodePath = '',
    workingDirectory = { mode = 'location' },
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = 'separateLine',
      },
      showDocumentation = {
        enable = true,
      },
    },
  },
}
