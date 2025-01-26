local wezterm = require("wezterm")

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local args = {}
	if cmd then
		args = cmd.args
	end

	local t2t_dir = wezterm.home_dir .. "/dev/personal/term2term"

	local rs_t, rs_p, rs_w = mux.spawn_window({
		workspace = "term2term",
		cwd = t2t_dir,
		args = args,

	})
	rs_p:send_text("hx .\n")
	rs_t:set_title("Helix")



	local c_t, c_p, c_w= rs_w:spawn_tab({
		cwd = t2t_dir,
	})
	c_p:send_text("lazygit\n")
	c_t:set_title("LazyGit")


	local build_t, build_p, build_w = c_w:spawn_tab({
		cwd = t2t_dir,
	})

	build_t:set_title("Build")

	build_p:send_text("just ")

	rs_t:activate()
end)
