return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      version = "^1.0.0",
    },
    "nvim-tree/nvim-web-devicons",
    {
      "aaronhallaert/advanced-git-search.nvim",
      dependencies = {
        "tpope/vim-fugitive",
        "sindrets/diffview.nvim",
      },
    },
  },
  config = function()
    local actions = require("telescope.actions")
    local themes = require("telescope.themes")

    local select_one_or_multi = function(prompt_bufnr)
      local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
      local multi = picker:get_multi_selection()
      if not vim.tbl_isempty(multi) then
        require("telescope.actions").close(prompt_bufnr)
        for _, j in pairs(multi) do
          if j.path ~= nil then
            vim.cmd(string.format("%s %s", "edit", j.path))
          end
        end
      else
        require("telescope.actions").select_default(prompt_bufnr)
      end
    end

    require("telescope").setup({
      -- pickers = {
      --   find_files = {
      --     theme = "dropdown",
      --   },
      --   live_grep = {
      --     theme = "ivy",
      --   },
      --   help_tags = {
      --     theme = "cursor",
      --   },
      -- },
      extensions = {
        advanced_git_search = {
          -- fugitive or diffview
          diff_plugin = "diffview",
          -- customize git in previewer
          -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
          git_flags = {},
          -- customize git diff in previewer
          -- e.g. flags such as { "--raw" }
          git_diff_flags = {},
          -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
          show_builtin_git_pickers = true,
        },
      },
      defaults = {
        path_display = { "truncate" },
        mappings = {
          -- n = {
          --   ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          -- },
          i = {
            ["<C-j>"] = actions.cycle_history_next,
            ["<C-k>"] = actions.cycle_history_prev,
            ["<CR>"] = select_one_or_multi,
            ["<C-h>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
          },
        },
      },
    })

    -- Enable telescope fzf native
    pcall(require("telescope").load_extension, "fzf")

    -- Enable telescope live grep args
    pcall(require("telescope").load_extension, "live_grep_args")

    -- Enable advanced git search
    pcall(require("telescope").load_extension, "advanced_git_search")

    -- Enable harpoon
    require("telescope").load_extension("harpoon")

    -- set keymaps
    local keymap = vim.keymap
    local builtin = require("telescope.builtin")

    keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Show recently opened files" })
    keymap.set("n", "<leader>bb", builtin.buffers, { desc = "Show current buffers" })
    keymap.set("n", "<leader>ff", function()
      builtin.current_buffer_fuzzy_find(themes.get_dropdown({
        winblend = 10,
        previewer = false,
      }))
    end, { desc = "Fuzzy search in current buffer" })
    keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Search git files" })
    keymap.set("n", "<leader>fa", builtin.find_files, { desc = "Search all files" })
    keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Search in help" })
    keymap.set("n", "<leader>ft", builtin.grep_string, { desc = "Search for current word" })
    -- live_grep_args does the same, but with highlighting
    -- keymap.set("n", "<leader>fs", function()
    --   builtin.grep_string({ search = vim.fn.input("Grep > "), desc = "Grep search" })
    -- end)
    keymap.set("n", "<leader>fs", require("telescope").extensions.live_grep_args.live_grep_args, { desc = "Advanced grep search" })
    keymap.set("n", "<leader>fS", builtin.live_grep, { desc = "Basic fuzzy grep search" })
    keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Search diagnostics" })
    keymap.set("n", "<leader>fb", builtin.git_commits, { desc = "Search git commits" })
    keymap.set("n", "<leader>fv", builtin.git_bcommits, { desc = "Search git commits for buffer" })
    keymap.set("n", "<leader>fw", builtin.lsp_dynamic_workspace_symbols, { desc = "Search workspace symbols" })
    keymap.set("n", "<leader>ga", "<cmd>AdvancedGitSearch<cr>", { desc = "Advanced Git Search" })
  end,
}
