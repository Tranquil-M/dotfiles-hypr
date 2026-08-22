-- Variables
local mainMod = "SUPER"
local ipc = "noctalia msg"

-- Cosmetic
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(ipc .. " bar-toggle"))

-- Laptop
hl.bind("switch:on:Lid Switch",
    hl.dsp.exec_cmd(ipc .. " session lock-and-suspend"),
    { locked = true }
)
