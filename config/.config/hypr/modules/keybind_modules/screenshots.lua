-- Variables
local mainMod = "SUPER"

-- Execution
hl.bind(mainMod .. " + z", hl.dsp.exec_cmd('hyprshot -m region --freeze -r -o --clipboard-only /tmp | satty --filename -'))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd('hyprshot -m output --freeze -r -o --clipboard-only /tmp | satty --filename -'))
