require("codecompanion").setup({
  adapters = {
    acp = {
      codex = function()
        return require("codecompanion.adapters").extend("codex", {
          defaults = {
            auth_method = "chat-gpt",
          },
          env = {
            -- ACP의 read-only ID는 현재 "Ask for approval" 모드입니다.
            INITIAL_AGENT_MODE = "read-only",
            CODEX_CONFIG = vim.json.encode({
              developer_instructions = "항상 한국어 존댓말로 답변하세요. 사용자가 직접 코딩하고 문서를 작성합니다. "
                .. "기본적으로 설명, 검토, 대안만 제안하고, 명시적으로 요청받기 전에는 파일을 수정하지 마세요.",
            }),
          },
        })
      end,
    },
  },
  interactions = {
    chat = {
      adapter = "codex",
    },
  },
  display = {
    chat = {
      window = {
        layout = "vertical",
        position = "right",
        full_height = true,
        width = 0.35,
      },
    },
  },
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("CodeCompanionCompletion", { clear = true }),
  pattern = "codecompanion",
  callback = function(event)
    vim.b[event.buf].minicompletion_config = {
      fallback_action = "<C-x><C-o>",
    }
  end,
})

vim.keymap.set("n", "<leader>aa", "<cmd>CodeCompanionChat Toggle<CR>", {
  desc = "AI 대화 창을 열거나 숨깁니다",
})
vim.keymap.set("x", "<leader>av", "<cmd>CodeCompanionChat Add<CR>", {
  desc = "선택한 내용을 AI 대화에 추가합니다",
})
vim.keymap.set({ "n", "x" }, "<leader>ap", "<cmd>CodeCompanionActions<CR>", {
  desc = "AI 작업 메뉴를 엽니다",
})
