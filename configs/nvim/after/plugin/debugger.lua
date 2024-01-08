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

require('dap-cortex-debug').setup {
    debug = true,  -- log debug messages
    -- path to cortex-debug extension, supports vim.fn.glob
    extension_path = '~/.vscode/extensions/marus25.cortex-debug-*',
    lib_extension = nil, -- tries auto-detecting, e.g. 'so' on unix
    node_path = 'node', -- path to node.js executable
    dapui_rtt = true, -- register nvim-dap-ui RTT element
    dap_vscode_filetypes = { 'c', 'cpp' }, -- make :DapLoadLaunchJSON register cortex-debug for C/C++, set false to disable
}
