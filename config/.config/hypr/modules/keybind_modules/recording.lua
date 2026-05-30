-- Variables
local mainMod = "SUPER"

-- Execution
hl.bind(mainMod .. " + ALT + z", hl.dsp.exec_cmd('pactl set-default-source "$(pactl get-default-sink).monitor"; hyprcap rec monitor:active --audio -wc'))
