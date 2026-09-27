-- 변경 표시가 나타날 때 본문이 좌우로 움직이지 않도록 공간을 확보합니다.
vim.opt.signcolumn = "yes"

local gitsigns = require("gitsigns")
gitsigns.setup({
  attach_to_untracked = true,
  current_line_blame = true,
  on_attach = function(bufnr)
    local function map(mode, key, action, desc)
      vim.keymap.set(mode, key, action, { buffer = bufnr, desc = desc })
    end

    map("n", "]c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gitsigns.nav_hunk("next")
      end
    end, "다음 Git 변경으로 이동")
    map("n", "[c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gitsigns.nav_hunk("prev")
      end
    end, "이전 Git 변경으로 이동")

    map("n", "<leader>hp", gitsigns.preview_hunk, "현재 변경 미리보기")
    map("n", "<leader>hs", gitsigns.stage_hunk, "현재 변경 stage / unstage")
    map("x", "<leader>hs", function()
      gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
    end, "선택한 변경 stage / unstage")
    map("n", "<leader>hS", gitsigns.stage_buffer, "현재 파일 전체 stage")
    map("n", "<leader>hr", gitsigns.reset_hunk, "현재 변경 되돌리기")
    map("n", "<leader>hb", function()
      gitsigns.blame_line({ full = true })
    end, "현재 줄의 커밋 정보")
    map("n", "<leader>hd", gitsigns.diffthis, "현재 파일과 Git index 비교")
    map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "줄 끝 blame 표시 전환")
    map({ "o", "x" }, "ih", gitsigns.select_hunk, "Git 변경 영역 선택")
  end,
})

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGitCurrentFile<CR>", {
  desc = "현재 파일의 저장소에서 LazyGit 열기",
})
vim.keymap.set("n", "<leader>gG", "<cmd>LazyGit<CR>", {
  desc = "현재 작업 디렉터리에서 LazyGit 열기",
})
