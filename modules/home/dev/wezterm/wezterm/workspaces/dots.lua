local wezterm = require("wezterm")

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local args = {}
	if cmd then
		args = cmd.args
	end

	local dots_dir = wezterm.home_dir .. "/dots"

	local nix_dots_t, nix_dots_p, nix_dots_w = mux.spawn_window({
		workspace = "dots",
		cwd = dots_dir .. "/nixdots",
		args = args,
	})
	nix_dots_t:set_title("nixdots")
	nix_dots_p:send_text("nvim .\n")

	local build_t, build_p, build_w = nix_dots_w:spawn_tab({
		cwd = dots_dir .. "/nvim",
	})

	local nix_build = build_p:split({
		direction = "Left",
		size = 0.5,
		cwd = dots_dir .. "/nixdots",
	})

	build_t:set_title("build")

	nix_dots_t:activate()
end)

return {}
