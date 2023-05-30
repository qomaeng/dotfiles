local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- c
  b.formatting.clang_format.with({
    filetype = { "c", "cpp", "objc" },
  }),
  b.diagnostics.clang_check.with({
    filetype = { "c", "cpp", "objc" },
  }),

  -- rust
  b.formatting.rustfmt.with({
    extra_args = function(params)
      local Path = require("plenary.path")
      local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

      if cargo_toml:exists() and cargo_toml:is_file() then
        for _, line in ipairs(cargo_toml:readlines()) do
          local edition = line:match([[^edition%s*=%s*%"(%d+)%"]])
          if edition then
            return { "--edition=" .. edition }
          end
        end
      end
      -- default edition when we don't find `Cargo.toml` or the `edition` in it.
      return { "--edition=2021" }
    end,
  }),

  -- python
  b.formatting.black.with({
    prefer_local = ".venv/bin",
  }),
  b.formatting.isort.with({
    prefer_local = ".venv/bin",
  }),
  b.diagnostics.flake8.with({
    prefer_local = ".venv/bin",
  }),
  b.diagnostics.mypy.with({
    prefer_local = ".venv/bin",
  }),
  b.diagnostics.pydocstyle.with({
    prefer_local = ".venv/bin",
  }),

  -- terraform
  b.formatting.terraform_fmt,
  b.diagnostics.terraform_validate,
  b.diagnostics.tfsec,

  -- webdev stuff
  b.formatting.prettier.with({
    filetype = { "html", "json", "markdown", "scss", "css", "typescript" },
    prefer_local = "node_modules/.bin",
  }),
  b.formatting.eslint.with({
    filetype = { "html", "json", "markdown", "scss", "css", "typescript" },
    prefer_local = "node_modules/.bin",
  }),
  b.diagnostics.eslint.with({
    filetype = { "html", "json", "markdown", "scss", "css", "typescript" },
    prefer_local = "node_modules/.bin",
  }),
  b.code_actions.eslint.with({
    filetype = { "html", "json", "markdown", "scss", "css", "typescript" },
    prefer_local = "node_modules/.bin",
  }),

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with({
    diagnostics_format = "#{m} [#{c}]",
  }),

  -- YAML
  b.formatting.yamlfmt,
  b.diagnostics.yamllint,
}

null_ls.setup({
  debug = true,
  sources = sources,
})
