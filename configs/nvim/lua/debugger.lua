local dap = require('dap')

require('dap').set_log_level('TRACE')

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";
    program = "${file}";
    pythonPath = function()
      return '/usr/bin/python'
    end;
  },
}
dap.adapters.cppdbg = {
  type = 'executable',
  command = '/home/zul/src/cpptools-linux/extension/debugAdapters/bin/OpenDebugAD7',
}

dap.adapters['cortex-debug'] = {
  type = 'executable',
  command = 'node',
  args = {'/home/zul/src/cortex-debug/dist/debugadapter.js'}
}

dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = true,
    setupCommands= {
      {
        description= 'Enable pretty-printing for gdb',
        text= '-enable-pretty-printing',
        ignoreFailures= true
      },
    },
  },
  {
    name = 'Attach to gdbserver : 2331',
    type = 'cppdbg',
    request = 'launch',
    MIMode = 'gdb',
    miDebuggerServerAddress = 'localhost:2331',
    -- miDebuggerPath = '/usr/bin/gdb',
    miDebuggerPath = '/usr/local/bin/arm-none-eabi-gdb',
    miDebuggerArgs = '-x .gdbinit',
    targetArchitecture = 'arm',
    cwd = '${workspaceFolder}',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    setupCommands= {
      {
        description= 'Enable pretty-printing for gdb',
        text= '-enable-pretty-printing',
        ignoreFailures= true
      },
    },
  },
  -- {
  --   name= "Debug JLink",
  --   type= "cppdbg",
  --   request= "launch",
  --   MIMode= "gdb",
  --   miDebuggerServerAddress= 'localhost:2331',
  --   miDebuggerPath= "arm-none-eabi-gdb",
  --   miDebuggerArgs= "-x ${workspaceFolder}/.gdbinit",
  --   debugServerPath= "JLinkGDBServer",
  --   debugServerArgs= "-if SWD -device STM32L451RE -port 2331",
  --   serverStarted= "Connected to target",
  --   -- program= "/Users/Code/strgg/build/strgg/strgg.elf",
  --   program = function()
  --     return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
  --   end,
  --   cwd= "${workspaceFolder}",
  --   externalConsole= false,
  --   stopAtEntry= false,
  -- },
  {
    request= "launch",
    type= "cortex-debug",
    name= "Debug Jlink",
    cwd= "${workspaceFolder}",
    executable= "${workspaceFolder}/BUILD/LD_EU868_DEBUG_STANDALONE/GCC_ARM/artifact.elf",
    servertype= "jlink",
    interface= "swd",
    device= "STM32L451RE",
    armToolchainPath= "/home/zul/src/gcc-arm-none-eabi/gcc-arm-none-eabi-6-2017-q2-update/bin/",
    showDevDebugOuput= true,
    gdbPath= "/home/zul/src/gcc-arm-none-eabi/gcc-arm-none-eabi-6-2017-q2-update/bin/arm-none-eabi-gdb"
  },
  {
    request= "attach",
    type= "cortex-debug",
    name= "Debug Jlink (attach)",
    cwd= "${workspaceFolder}",
    executable= "${workspaceFolder}/BUILD/LD_EU868_DEBUG_STANDALONE/GCC_ARM/artifact.elf",
    servertype= "jlink",
    interface= "swd",
    device= "STM32L451RE",
    armToolchainPath= "/home/zul/src/gcc-arm-none-eabi/gcc-arm-none-eabi-6-2017-q2-update/bin/",
    showDevDebugOuput= true,
    gdbPath= "/home/zul/src/gcc-arm-none-eabi/gcc-arm-none-eabi-6-2017-q2-update/bin/arm-none-eabi-gdb"
  }


}
require('dap.ext.vscode').load_launchjs()

require("dapui").setup({
  sidebar = {
     elements = {
      { id = "scopes", size = 0.25, },
      { id = "breakpoints", size = 0.25 },
      { id = "stacks", size = 0.25 },
      { id = "watches", size = 0.10 },
    },
  }
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
