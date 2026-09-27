local picker = require("yanky.picker")

require("yanky").setup({
  ring = {
    history_length = 100,
    storage = "shada",
    -- 번호 레지스터는 Neovim의 기본 삭제 이력으로 유지합니다.
    sync_with_numbered_registers = false,
  },
  picker = {
    select = {
      action = function(item)
        if vim.bo.buftype == "terminal" then
          if item then
            if vim.bo.filetype == "lazygit" then
              -- 제목 입력칸에 직접 put하면 개행이 사라집니다.
              -- LazyGit의 커밋 메뉴로 제목과 본문을 함께 가져옵니다.
              vim.fn.setreg("+", item.regcontents, item.regtype)
              vim.api.nvim_chan_send(vim.b.terminal_job_id, "\15p") -- Ctrl-o, p
            else
              -- 일반 터미널에는 undo 기반 이력 순환 대신 기본 put으로 전달합니다.
              local text = item.regcontents
              if item.regtype == "V" then
                text = text:gsub("\n$", "")
              end
              local saved = vim.fn.getreginfo("z")
              vim.fn.setreg("z", text, "v")
              vim.cmd.normal({ '"zp', bang = true })
              vim.fn.setreg("z", saved)
            end
          end
          vim.cmd.startinsert()
        else
          picker.actions.put("p")(item)
        end
      end,
    },
  },
})

vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)", { desc = "복사하고 이력에 저장" })

-- Visual mode의 p/P는 기본 교체 동작을 유지합니다.
for key, plug in pairs({ p = "YankyPutAfter", P = "YankyPutBefore", gp = "YankyGPutAfter", gP = "YankyGPutBefore" }) do
  vim.keymap.set("n", key, function()
    return vim.bo.buftype == "terminal" and key or "<Plug>(" .. plug .. ")"
  end, { expr = true, desc = "복사한 내용 붙여넣기" })
end

for key, plug in pairs({ ["<C-p>"] = "YankyPreviousEntry", ["<C-n>"] = "YankyNextEntry" }) do
  vim.keymap.set("n", key, function()
    return vim.bo.buftype == "terminal" and key or "<Plug>(" .. plug .. ")"
  end, { expr = true, desc = "붙여넣은 내용을 복사 이력에서 교체" })
end

vim.keymap.set("n", "<leader>fy", "<cmd>YankyRingHistory<CR>", {
  desc = "복사 이력 검색 및 붙여넣기",
})
