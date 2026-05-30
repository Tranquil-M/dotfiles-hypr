-- Variables
local mainMod = "SUPER"

-- Helper Functions
local record_desktop_audio = [[
if pgrep -x wf-recorder >/dev/null; then
    hyprcap rec monitor:active -wN
    mpv ~/.config/hypr/sfx/end_record.caf
    while pgrep -x wf-recorder >/dev/null; do sleep 0.1; done
    mpv ~/Videos/Captures/"$(exa -s=mod -r -1 ~/Videos/Captures | head -n1)"
else
    mpv ~/.config/hypr/sfx/begin_record.caf
    pactl set-default-source easyeffects_sink.monitor
    hyprcap rec monitor:active -wN
fi
]]

-- Execution
hl.bind(mainMod .. " + ALT + z", hl.dsp.exec_cmd(record_desktop_audio))
