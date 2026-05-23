-- Variables
local mainMod = "SUPER"
local ipc = "qs -c noctalia-shell ipc call"

-- Core
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(ipc .. " launcher toggle"))
hl.bind(mainMod .. " + C",     hl.dsp.exec_cmd(ipc .. " controlCenter toggle"))
hl.bind(mainMod .. " + S",     hl.dsp.exec_cmd(ipc .. " settings toggle"))
hl.bind(mainMod .. " + M",     hl.dsp.exec_cmd(ipc .. " media toggle"))
hl.bind(mainMod .. " + N",     hl.dsp.exec_cmd(ipc .. " notifications toggleHistory"))
hl.bind(mainMod .. " + X",     hl.dsp.exec_cmd(ipc .. " launcher emoji"))
hl.bind(mainMod .. " + V",     hl.dsp.exec_cmd(ipc .. " clipboard"))
hl.bind(mainMod .. " + B",     hl.dsp.exec_cmd(ipc .. " battery togglePanel"))

hl.bind("ALT + Tab", hl.dsp.exec_cmd(ipc .. " launcher windows"))

-- Media keys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd(ipc .. " volume increase"))
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd(ipc .. " volume decrease"))
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd(ipc .. " volume muteOutput"))
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(ipc .. " brightness increase"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness decrease"))
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"))

-- System
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(ipc .. " bar toggle"))

-- Applications
hl.bind(mainMod .. " + RETURN",    hl.dsp.exec_cmd("kitty"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("nemo"))
hl.bind(mainMod .. " + E",         hl.dsp.exec_cmd(ipc .. " wallpaper toggle"))

-- Screenshots
hl.bind(mainMod .. " + Z",         hl.dsp.exec_cmd("sh ~/.config/hypr/conf/scripts/screenshot_region.sh"))
hl.bind(mainMod .. " + SHIFT + Z", hl.dsp.exec_cmd("sh ~/.config/hypr/conf/scripts/screenshot_screen.sh"))

-- Window management (REAL dispatchers)

hl.bind(mainMod .. " + W", hl.dsp.window.kill())
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + T", hl.dsp.window.center())

hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + F",        hl.dsp.window.fullscreen({ mode = "maximized" }))

hl.bind(mainMod .. " + BACKSPACE", hl.dsp.exec_cmd(ipc .. " sessionMenu toggle"))

-- Notifications
hl.bind(mainMod .. " + COMMA",        hl.dsp.exec_cmd(ipc .. " notifications removeOldestHistory"))
hl.bind(mainMod .. " + SHIFT + COMMA", hl.dsp.exec_cmd(ipc .. " notifications clear"))

-- Focus movement (correct dispatcher: movefocus)
hl.bind(mainMod .. " + LEFT",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + RIGHT", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + UP",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + DOWN",  hl.dsp.focus({ direction = "d" }))

-- Window movement (correct dispatcher: movewindow)
hl.bind(mainMod .. " + SHIFT + LEFT",  hl.dsp.window.move({direction = "l" }))
hl.bind(mainMod .. " + SHIFT + RIGHT", hl.dsp.window.move({direction = "r" }))
hl.bind(mainMod .. " + SHIFT + UP",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + DOWN",  hl.dsp.window.move({ direction = "d" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Workspaces
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Laptop suspend
hl.bind("switch:on:Lid Switch",
    hl.dsp.exec_cmd(ipc .. " lockScreen lock & systemctl suspend"),
    { locked = true }
)
