local function assign()
    local monitors = hl.get_monitors()

    for i, m in ipairs(monitors) do
        local base = (i - 1) * 3

        for j = 1, 3 do
            local ws = base + j
            hl.workspace_rule({ workspace = ws, monitor = m.name, persistent = true })
        end
    end
end

assign()

hl.on("hyprland.start", assign)
hl.on("config.reloaded", assign)
hl.on("monitor.added", assign)
hl.on("monitor.removed", assign)
hl.on("monitor.focused", assign)
hl.on("monitor.layout_changed", assign)
