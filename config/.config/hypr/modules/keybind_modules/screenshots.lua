-- Variables
local mainMod = "SUPER"

-- Execution
hl.bind(mainMod .. " + z", hl.dsp.exec_cmd('hyprcap shot region -WFNcz -o ~/Pictures/Screenshots && mpv $HOME/.config/hypr/sfx/Grab.aif && satty --filename ~/Pictures/Screenshots/"$(exa -s=mod -r -1 ~/Pictures/Screenshots | head -n1)"'))

hl.bind(mainMod .. " + SHIFT + z", hl.dsp.exec_cmd('hyprcap shot monitor -WFNc -o ~/Pictures/Screenshots && mpv $HOME/.config/hypr/sfx/Grab.aif && satty --filename ~/Pictures/Screenshots/"$(exa -s=mod -r -1 ~/Pictures/Screenshots | head -n1)"'))
