local wezterm = require("wezterm")

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local args = {}
	if cmd then
		args = cmd.args
	end

	local ectf_dir
		 = wezterm.home_dir .. "/dev/clubs/ectf"

	local rs_t, rs_p, rs_w = mux.spawn_window({
		workspace = "ectf",
		cwd = ectf_dir
		   .. '/ucsc-ectf-2025',
		args = args,

	})
	rs_p:send_text("hx .\n")
	rs_t:set_title("Helix")

	local c_t, c_p, c_w= rs_w:spawn_tab({
		cwd = ectf_dir
		   .. '/ucsc-ectf-2025'
		,
	})
	c_p:send_text("lazygit\n")
	c_t:set_title("LazyGit")


	local build_t, build_p, build_w = c_w:spawn_tab({
		cwd = ectf_dir .. '/ucsc-ectf-2025'
		,
	})

	build_t:set_title("Build")


	rs_t:activate()
end)
