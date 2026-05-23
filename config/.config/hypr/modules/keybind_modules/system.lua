-- Variables
local mainMod = "SUPER"
local ipc = "qs -c noctalia-shell ipc call"

-- Cosmetic
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(ipc .. " bar toggle"))

-- Laptop
hl.bind("switch:on:Lid Switch",
    hl.dsp.exec_cmd(ipc .. " lockScreen lock & systemctl suspend"),
    { locked = true }
)
