-- Variables
local mainMod = "SUPER"
local ipc = "noctalia msg"

-- Execution
hl.bind(mainMod .. " + z", hl.dsp.exec_cmd(ipc .. " plugin alexander/screen-toolkit:service all annotate"))

hl.bind(mainMod .. " + SHIFT + z", hl.dsp.exec_cmd(ipc .. " plugin alexander/screen-toolkit:service all annotateFullscreen"))
