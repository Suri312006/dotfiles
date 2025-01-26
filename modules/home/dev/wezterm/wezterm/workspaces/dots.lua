local wezterm = require("wezterm")

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local args = {}
	if cmd then
		args = cmd.args
	end

	local dots_dir = wezterm.home_dir .. "/dots/nixdots"

	local nix_dots_t, nix_dots_p, nix_dots_w = mux.spawn_window({
		workspace = "dots",
		cwd = dots_dir,
		args = args,
	})
	nix_dots_t:set_title("nixdots")
	nix_dots_p:send_text("hx .\n")

	local build_t, build_p, build_w = nix_dots_w:spawn_tab({
		cwd = dots_dir
	})


	build_t:set_title("build")

	nix_dots_t:activate()
end)

return {}
