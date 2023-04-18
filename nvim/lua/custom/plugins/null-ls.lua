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
