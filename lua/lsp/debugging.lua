return {
  -- 'mfussenegger/nvim-dap',
  -- enabled = false,
  -- dependencies = {
  --   "rcarriga/nvim-dap-ui"
  -- },
  -- config = function()
  --   require("dap-up").setup()
  --
  --   local dap = require("dap")
  --   local dapui require("dapui")
  --   dap.listeners.before.attach.dapui_config = function()
  --     dapui.open()
  --   end
  --   dap.listeners.before.launch.dapui_config = function()
  --     dapui.open()
  --   end
  --   dap.listeners.before.event_terminated.dapui_config = function()
  --     dapui.close()
  --   end
  --   dap.listeners.before.event_exited.dapui_config = function()
  --     dapui.close()
  --   end
  --   vim.keymap.set('n', '<leader>dt', dap.toggle_breakpoint, {})
  --   vim.keymap.set('n', '<leader>dc', dap.continue, {})
  -- end
}



  -- {
  --   'mfussenegger/nvim-dap',
  --   dependencies = {
  --     {
  --       'rcarriga/nvim-dap-ui',
  --       dependencies = "nvim-neotest/nvim-nio",
  --   opts = {},
  --     },
  --     {
  --       "microsoft/vscode-js-debug",
  --       opts = true,
  --       build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
  --     },
  --
  -- BUG: THIS PLUGIN CAUSES "STACE CORRUPTION ERROR"
  --     {
  --       "mxsdev/nvim-dap-vscode-js",
  --       config = function()
  --         require("dap-vscode-js").setup({
  --           adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
  --         })
  --
  --         for _, language in ipairs({ "typescript", "javascript", "typescriptreact", "javascriptreact" }) do
  --           require("dap").configurations[language] = {
  --             {
  --               type = "pwa-node",
  --               request = "launch",
  --               name = "Launch file",
  --               program = "${file}",
  --               cwd = "${workspaceFolder}",
  --             },
  --             {
  --               type = "pwa-node",
  --               request = "attach",
  --               name = "Attach",
  --               processId = require'dap.utils'.pick_process,
  --               cwd = "${workspaceFolder}",
  --             }
  --           }
  --         end
  --       end
  --     }
  --   },
  --   config = function()
  --     local dap, dapui = require("dap"), require("dapui")
  --     dap.listeners.before.attach.dapui_config = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.launch.dapui_config = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated.dapui_config = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited.dapui_config = function()
  --       dapui.close()
  --     end
  --   end
  --  },
