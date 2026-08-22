-- Variables
local ipc = "noctalia msg"

-- Audio and brightness
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd(ipc .. " volume-up"))
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd(ipc .. " volume-down"))
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd(ipc .. " volume-mute"))
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(ipc .. " brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness-down"))

-- Media Player
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"))

