-- Variables
local mainMod = "SUPER"
local ipc = "noctalia msg"

-- Bar
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))
hl.bind(mainMod .. " + C",     hl.dsp.exec_cmd(ipc .. " panel-toggle control-center"))
hl.bind(mainMod .. " + S",     hl.dsp.exec_cmd(ipc .. " settings-open"))
hl.bind(mainMod .. " + N",     hl.dsp.exec_cmd(ipc .. " panel-toggle control-center notifications"))
hl.bind(mainMod .. " + B",     hl.dsp.exec_cmd(ipc .. " panel-toggle piero-93/battery-power-management:panel"))

-- Logout
hl.bind(mainMod .. " + BACKSPACE", hl.dsp.exec_cmd(ipc .. " panel-toggle session"))
