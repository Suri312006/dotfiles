local wezterm = require("wezterm")

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local args = {}
	if cmd then
		args = cmd.args
	end

	local grad_dir = wezterm.home_dir .. "/dev/personal/graduate"

	local rs_t, rs_p, rs_w = mux.spawn_window({
	    workspace = "graduate",
	    cwd = grad_dir ,
	    args = args,
	})

	rs_p:send_text("hx .\n")
	rs_t:set_title("Helix")

	rs_t:activate()
end)
