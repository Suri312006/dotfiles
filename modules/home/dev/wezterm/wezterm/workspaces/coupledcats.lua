local wezterm = require("wezterm")

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local args = {}
	if cmd then
		args = cmd.args
	end

	local cats_dir = wezterm.home_dir .. "/dev/personal/coupled-cats"
	local rs_t, rs_p, rs_w = mux.spawn_window({
		workspace = "coupled-cats",
		cwd = cats_dir,
		args = args,
	})

	rs_p:send_text("lazygit\n")
	rs_t:set_title("git")

	local build_t, build_p, build_w = rs_w:spawn_tab({
		cwd = cats_dir,
	})

	build_t:set_title("build")

	build_p:send_text("nix-shell\n")
	build_p:send_text("clear\n")
	build_p:send_text("zeditor .")

	rs_t:activate()
end)
