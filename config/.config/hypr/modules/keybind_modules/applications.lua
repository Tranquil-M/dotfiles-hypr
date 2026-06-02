-- Variables
local mainMod = "SUPER"
local ipc = "qs -c noctalia-shell ipc call"

-- Apps
hl.bind(mainMod .. " + RETURN",    hl.dsp.exec_cmd("kitty"))

-- Noctalia
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(ipc .. " wallpaper toggle"))
hl.bind(mainMod .. " + X",     hl.dsp.exec_cmd(ipc .. " launcher emoji"))
hl.bind(mainMod .. " + V",     hl.dsp.exec_cmd(ipc .. " launcher clipboard"))
hl.bind(mainMod .. " + M",     hl.dsp.exec_cmd(ipc .. " media toggle"))
hl.bind("ALT + Tab", hl.dsp.exec_cmd(ipc .. " launcher windows"))
