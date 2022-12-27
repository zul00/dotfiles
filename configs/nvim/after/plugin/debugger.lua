local dap, dapui = require("dap"), require("dapui")

-- basic setup
-- Set to TRACE for only for debugging the dap
dap.set_log_level('TRACE')
dapui.setup()

-- Automatically open dapui
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
end
