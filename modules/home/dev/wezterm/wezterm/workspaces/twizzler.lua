local wezterm = require("wezterm")

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local args = {}
	if cmd then
		args = cmd.args
	end

	local twizz_dir = wezterm.home_dir .. "/dev/work/Twizzler"

	local rs_t, rs_p, rs_w = mux.spawn_window({
	    workspace = "twizzler",
	    cwd = twizz_dir .. "/twizzler",
	    args = args,
	})

	rs_p:send_text("hx .\n")
	rs_t:set_title("Helix")

	local os_git_t, os_git_p, os_git_w = rs_w:spawn_tab({
		cwd = twizz_dir .. "/twizzler",
	})

	os_git_p:send_text("lazygit\n")
	os_git_t:set_title("LazyGit")


	local os_t, os_p, os_w = os_git_w:spawn_tab({
		cwd = twizz_dir .. "/twizzler",
	})

	os_p:send_text('docker run -v "$(pwd)":/twizzler -it twizzler:latest\n')
	os_t:set_title("os_container")

	os_git_t:activate()
end)
