return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- Creates a debugger UI
    "rcarriga/nvim-dap-ui",

    -- Required as of v4.0.0
    "nvim-neotest/nvim-nio",

    -- Debug adapters
    "williamboman/mason.nvim",
    "jay-babu/mason-nvim-dap.nvim",

    -- Add debuggers here
    "leoluz/nvim-dap-go",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    require("mason-nvim-dap").setup({
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        "delve", -- Debugger for Go
      },
    })

    -- Basic debugging keymaps
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debugger: Continue" })
    vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debugger: Step into" })
    vim.keymap.set("n", "<F2>", dap.step_over, { desc = "Debugger: Step over" })
    vim.keymap.set("n", "<F3>", dap.step_out, { desc = "Debugger: Step out" })
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Debugger: Toggle breakpoint" })
    vim.keymap.set("n", "<leader>dB", function()
      dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
    end, { desc = "Debugger: Breakpoint condition" })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup({
      -- Set icons to characters that are more likely to work in every terminal.
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      controls = {
        icons = {
          pause = "⏸",
          play = "▶",
          step_into = "⏎",
          step_over = "⏭",
          step_out = "⏮",
          step_back = "b",
          run_last = "▶▶",
          terminate = "⏹",
          disconnect = "⏏",
        },
      },
    })
    -- toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set("n", "<F7>", dapui.toggle)

    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    -- Install golang specific config
    require("dap-go").setup()
  end,
}
