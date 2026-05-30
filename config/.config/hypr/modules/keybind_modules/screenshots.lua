-- Variables
local mainMod = "SUPER"

-- Helper Functions
local regional_screenshot = table.concat({
      "hyprcap shot region -WFNcz -o /tmp/screenies/",
      "mpv $HOME/.config/hypr/sfx/Grab.aif",
      'satty --filename /tmp/screenies/"$(exa -s=mod -r -1 /tmp/screenies | head -n1)"',
}, " && ")

local monitor_screenshot = table.concat({
      "hyprcap shot monitor -WFNcz -o /tmp/screenies/",
      "mpv $HOME/.config/hypr/sfx/Grab.aif",
      'satty --filename /tmp/screenies/"$(exa -s=mod -r -1 /tmp/screenies | head -n1)"',
}, " && ")

-- Execution
hl.bind(mainMod .. " + z", hl.dsp.exec_cmd(regional_screenshot))

hl.bind(mainMod .. " + SHIFT + z", hl.dsp.exec_cmd(monitor_screenshot))
