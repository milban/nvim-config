local biome_configs = { "biome.json", "biome.jsonc" }
local prettier_configs = {
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.json5",
  ".prettierrc.yaml",
  ".prettierrc.yml",
  ".prettierrc.toml",
  ".prettierrc.js",
  ".prettierrc.cjs",
  ".prettierrc.mjs",
  ".prettierrc.ts",
  ".prettierrc.cts",
  ".prettierrc.mts",
  "prettier.config.js",
  "prettier.config.cjs",
  "prettier.config.mjs",
  "prettier.config.ts",
  "prettier.config.cts",
  "prettier.config.mts",
}

local function is_prettier_config(name, path)
  if vim.tbl_contains(prettier_configs, name) then
    return true
  end

  if name == "package.json" then
    local ok, package_config = pcall(function()
      return vim.json.decode(table.concat(vim.fn.readfile(path .. "/" .. name), "\n"))
    end)
    return ok and type(package_config) == "table"
      and (type(package_config.prettier) == "table" or type(package_config.prettier) == "string")
  end

  return false
end

local function web_formatter(bufnr)
  -- 프로젝트에서 선택한 도구를 사용하고, 두 설정이 있으면 Biome을 우선합니다.
  if vim.fs.root(bufnr, biome_configs) then
    return { "biome" }
  end

  if vim.fs.root(bufnr, is_prettier_config) then
    return { "prettier" }
  end

  return {}
end

require("conform").setup({
  formatters_by_ft = {
    javascript = web_formatter,
    javascriptreact = web_formatter,
    typescript = web_formatter,
    typescriptreact = web_formatter,
    json = web_formatter,
    jsonc = web_formatter,
    css = web_formatter,
    graphql = web_formatter,
  },
  format_on_save = {
    timeout_ms = 1000,
    lsp_format = "fallback",
  },
  notify_no_formatters = false,
})
