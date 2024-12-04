local wezterm = require("wezterm")

local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
	local args = {}
	if cmd then
		args = cmd.args
	end

	local twizz_dir = wezterm.home_dir .. "/dev/work/Twizzler"
	local rs_t, rs_p, rs_w = mux.spawn_window({
		workspace = "term2term",
		cwd = twizz_dir .. "/twizsec",
		args = args,
	})

	rs_p:send_text("nvim .\n")
	rs_t:set_title("rs")

	-- local go_t, go_p, go_w = rs_w:spawn_tab {
	--     cwd = twizz_dir .. '/go',
	-- }
	--
	-- go_p:send_text 'nvim .\n'
	-- go_t:set_title 'go'

	rs_t:activate()
end)
