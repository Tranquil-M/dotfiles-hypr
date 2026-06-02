-- Variables
local mainMod = "SUPER"
local ipc = "qs -c noctalia-shell ipc call"

-- Execution
hl.bind(mainMod .. " + z", hl.dsp.exec_cmd(ipc .. " plugin:screen-toolkit annotate"))

hl.bind(mainMod .. " + SHIFT + z", hl.dsp.exec_cmd(ipc .. " plugin:screen-toolkit annotateFullscreen"))
