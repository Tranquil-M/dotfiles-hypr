-- Variables
local mainMod = "SUPER"
local ipc = "qs -c noctalia-shell ipc call"

-- Bar
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(ipc .. " launcher toggle"))
hl.bind(mainMod .. " + C",     hl.dsp.exec_cmd(ipc .. " controlCenter toggle"))
hl.bind(mainMod .. " + S",     hl.dsp.exec_cmd(ipc .. " settings toggle"))
hl.bind(mainMod .. " + N",     hl.dsp.exec_cmd(ipc .. " notifications toggleHistory"))
hl.bind(mainMod .. " + B",     hl.dsp.exec_cmd(ipc .. " battery togglePanel"))

-- Logout
hl.bind(mainMod .. " + BACKSPACE", hl.dsp.exec_cmd(ipc .. " sessionMenu toggle"))

-- Notifications
hl.bind(mainMod .. " + COMMA",        hl.dsp.exec_cmd(ipc .. " notifications removeOldestHistory"))
hl.bind(mainMod .. " + SHIFT + COMMA", hl.dsp.exec_cmd(ipc .. " notifications clear"))

-- Paste Fix
hl.bind("CTRL + V", hl.dsp.exec_cmd("cliphist list | head -n 1 | cliphist decode | wl-copy && wtype -M ctrl v -m ctrl"))
