local lint = require "lint"

lint.linters_by_ft = {
  fish = { "fish" },
  go = { "golangcilint" },
  javascript = { "eslint" },
  javascriptreact = { "eslint" },
  markdown = { "proselint" },
  python = { "flake8", "mypy" },
  svelte = { "eslint" },
  text = { "proselint" },
  typescript = { "eslint" },
  typescriptreact = { "eslint" },
}

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = lint_augroup,
  callback = function()
    lint.try_lint()
  end,
})

vim.keymap.set("n", "<leader>l", function()
  lint.try_lint()
end)
