local dap = require('dap')

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

  {
    name= "Debug JLink",
    type= "cppdbg",
    request= "launch",
    MIMode= "gdb",
    miDebuggerServerAddress= 'localhost:2331',
    miDebuggerPath= "arm-none-eabi-gdb",
    -- miDebuggerArgs= "-x ${workspaceFolder}/.gdbinit",
    debugServerPath= "JLinkGDBServer",
    debugServerArgs= "-if SWD -device STM32L451RE -port 2331",
    serverStarted= "Connected to target",
    -- program= "/Users/Code/strgg/build/strgg/strgg.elf",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd= "${workspaceFolder}",
    externalConsole= false,
    stopAtEntry= false,
  }
}

local widgets = require('dap.ui.widgets')
local frame1 = widgets.sidebar(widgets.frames)
local frame2 = widgets.sidebar(widgets.scopes)
function _G.my_sidebar()
  frame1.toggle() --(nil, 'aboveleft split') these parameters do not work!
  frame2.toggle() --(nil, 'botright split')
end
