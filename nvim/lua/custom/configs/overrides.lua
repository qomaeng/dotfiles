local M = {}

M.treesitter = {
  ensure_installed = {
    "c",
    "css",
    "html",
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "query",
    "rust",
    "terraform",
    "tsx",
    "typescript",
    "vim",
    "vimdoc",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  autotag = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- rust stuff
    "rust-analyzer",
    "rustfmt",
    "taplo",

    -- python stuff
    "pyright",
    "mypy",
    "isort",
    "flake8",
    "black",
    "pydocstyle",

    -- web dev stuff
    "css-lsp",
    "deno",
    "html-lsp",
    "typescript-language-server",
    "prettier",

    -- docker
    "docker-compose-language-service",
    "dockerfile-language-server",

    -- golang
    -- "gopls",

    -- shell
    "shellcheck",
    "shfmt",

    -- terraform
    "terraform-ls",
    "tflint",
    "trivy",

    -- Documents
    "marksman",
    "yaml-language-server",
    "yamlfmt",
    "yamllint",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
