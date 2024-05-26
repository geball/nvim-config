return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local signs = require("gitsigns")
    signs.setup({
      -- Highlight the line number of the changed line
      numhl = true,

      -- Highlight the whole line of a changed line
      -- Toggle with `:Gitsigns toggle_linehl` or gitsigns.toggle_linehl()
      linehl = false,

      -- Highlight the part of the line that has been changed
      -- Toggle with `:Gitsigns toggle_word_diff` or gitsigns.toggle_word_diff()
      word_diff = false,
      current_line_blame_opts = {
        delay = 200,
        virt_text_pos = "eol",
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        map("n", "[g", gs.prev_hunk, { desc = "Previous hunk" })
        map("n", "]g", gs.next_hunk, { desc = "Next hunk" })
        map("n", "<leader>gh", gs.stage_hunk, { desc = "Stage hunk" })
        map("n", "<leader>gH", gs.reset_hunk, { desc = "Reset hunk" })
        map("v", "<leader>gh", function()
          gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Stage hunk" })
        map("v", "<leader>gH", function()
          gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
        end, { desc = "Reset hunk" })
        map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
        map("n", "<leader>gu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
        map("n", "<leader>gb", gs.stage_buffer, { desc = "Stage buffer" })
        map("n", "<leader>gB", gs.reset_buffer, { desc = "Reset buffer" })
        map("n", "<leader>gl", function()
          gs.blame_line({ full = true })
        end, { desc = "Show blame for current line" })
        map("n", "<leader>gt", gs.toggle_current_line_blame, { desc = "Toggle line blame" })
        map("n", "<leader>gi", gs.toggle_linehl, { desc = "Toggle line highlight" })
        map("n", "<leader>gw", gs.toggle_word_diff, { desc = "Toggle word diff" })
        map("n", "<leader>gf", "<cmd>Git<CR>", { desc = "Show Fugitive" })
        map("n", "<leader>gF", ":Git ", { desc = "Trigger :Git in command line" })
        map("n", "<leader>gn", "<cmd>Neogit kind=auto<CR>", { desc = "Open Neogit" })
        map("n", "<leader>gx", gs.toggle_deleted, { desc = "Toggle deleted" })
      end,
    })
  end,
}
