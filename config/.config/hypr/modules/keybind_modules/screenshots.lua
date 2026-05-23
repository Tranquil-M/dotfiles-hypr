-- Variables
local mainMod = "SUPER"

-- Scripts
hl.bind(mainMod .. " + Z",         hl.dsp.exec_cmd("sh ~/.config/hypr/modules/scripts/screenshot_region.sh"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("sh ~/.config/hypr/modules/scripts/screenshot_screen.sh"))
