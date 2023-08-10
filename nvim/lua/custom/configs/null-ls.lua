local null_ls = require "null-ls"
local format = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics
local code = null_ls.builtins.code_actions

local sources = {
  -- c
  format.clang_format.with { filetype = { "c", "cpp", "objc" } },
  lint.clang_check.with { filetype = { "c", "cpp", "objc" } },

  -- rust
  format.rustfmt.with {
    extra_args = function(params)
      local Path = require "plenary.path"
      local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

      if cargo_toml:exists() and cargo_toml:is_file() then
        for _, line in ipairs(cargo_toml:readlines()) do
          local edition = line:match [[^edition%s*=%s*%"(%d+)%"]]
          if edition then
            return { "--edition=" .. edition }
          end
        end
      end
      -- default edition when we don't find `Cargo.toml` or the `edition` in it.
      return { "--edition=2021" }
    end,
  },

  -- python
  format.black.with { prefer_local = ".venv/bin" },
  format.isort.with { prefer_local = ".venv/bin" },
  lint.flake8.with { prefer_local = ".venv/bin" },
  lint.mypy.with { prefer_local = ".venv/bin" },
  lint.pydocstyle.with { prefer_local = ".venv/bin" },

  -- terraform
  format.terraform_fmt,
  lint.terraform_validate,
  lint.tfsec,

  -- webdev stuff
  format.prettier.with {
    filetype = { "html", "json", "markdown", "scss", "css", "javascript", "typescript" },
    prefer_local = "node_modules/.bin",
  },
  format.eslint.with {
    filetype = { "html", "json", "markdown", "scss", "css", "javascript", "typescript" },
    prefer_local = "node_modules/.bin",
  },
  lint.eslint.with {
    filetype = { "html", "json", "markdown", "scss", "css", "javascript", "typescript" },
    prefer_local = "node_modules/.bin",
  },
  code.eslint.with {
    filetype = { "html", "json", "markdown", "scss", "css", "javascript", "typescript" },
    prefer_local = "node_modules/.bin",
  },

  -- Lua
  format.stylua,

  -- Shell
  format.shfmt,
  lint.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- YAML
  format.yamlfmt,
  lint.yamllint,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
