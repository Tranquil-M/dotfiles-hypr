-- Variables
local mainMod = "SUPER"

-- Execution
hl.bind(mainMod .. " + z", hl.dsp.exec_cmd('grim -g "$(slurp)" - | satty -f -'))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd('grim - | satty -f -'))
