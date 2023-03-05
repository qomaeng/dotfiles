local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- c
  -- b.formatting.clang_format,
  -- b.diagnostics.clang_check,

  -- rust
  b.formatting.rustfmt,

  -- python
  b.formatting.black,
  b.formatting.isort,

  -- webdev stuff
  b.formatting.prettier.with {
    filetype = { "html", "json", "markdown", "scss", "css", "typescript" },
  },
  b.diagnostics.eslint,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
