-- Variables
local mainMod = "SUPER"

-- Execution
hl.bind(mainMod .. " + z", hl.dsp.exec_cmd('hyprcap shot region -WFNcrz - | satty --filename -'))

hl.bind(mainMod .. " + SHIFT + z", hl.dsp.exec_cmd('hyprcap shot monitor:active -WFNcr - | satty --filename -'))
