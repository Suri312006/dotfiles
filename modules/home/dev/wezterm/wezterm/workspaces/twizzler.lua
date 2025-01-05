local wezterm = require("wezterm")

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local args = {}
    if cmd then
        args = cmd.args
    end

    local twizz_dir = wezterm.home_dir .. "/dev/work/Twizzler"
    -- local rs_t, rs_p, rs_w = mux.spawn_window({
    --     workspace = "twizzler",
    --     cwd = twizz_dir .. "/twizsec",
    --     args = args,
    -- })

    -- rs_p:send_text("lazygit\n")
    -- rs_t:set_title("sec")

    local os_git_t, os_git_p, os_git_w = mux.spawn_window({
        workspace = "twizzler",
        cwd = twizz_dir .. "/twizzler",
        args = args,
    })

    os_git_p:send_text("lazygit\n")
    os_git_p:set_title("os git")

    -- local build_t, build_p, build_w = rs_w:spawn_tab({
    --     cwd = twizz_dir,
    -- })

    -- build_t:set_title("twizsec build")

    local os_t, os_p, os_w = os_git_w:spawn_tab({
        cwd = twizz_dir .. "/twizzler",
    })

    os_p:send_text('docker run -v "$(pwd)":/twizzler -it twizzler:latest\n')
    os_t:set_title("os_container")

    os_git_t:activate()
end)
