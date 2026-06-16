-- TODO :
-- fn + f1-f12 = do wtv thats on the symbol
-- any cool keybinds to explore!!!

local mod = "SUPER" -- win key

-- if you somehow changed apps, change it here
local appLaunch = "fuzzel"
local fileMngr = "thunar"
local terminal = "foot"
local screenshot = "flameshot gui"
local powerMenu = "wleave"
local stashCmd =
	"stash list | fuzzel -d -w 75 -l 20 --prompt 'Clip it! ' --placeholder 'Snip it!' | stash decode | wl-copy"

-- Apps
hl.bind(mod .. " + R", hl.dsp.exec_cmd(appLaunch), { description = "Runs " .. appLaunch .. " (App launcher)" })
hl.bind(mod .. " + E", hl.dsp.exec_cmd(fileMngr), { description = "Runs " .. fileMngr .. " (Explorer)" })
hl.bind(mod .. " + Q", hl.dsp.exec_cmd(terminal), { description = "Runs " .. terminal .. " (Terminal)" })
hl.bind(mod .. " + V", hl.dsp.exec_cmd(stashCmd), { description = "Runs Stash (Clipboard)" })
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd(screenshot), { description = "Runs " .. screenshot .. " (Screenshot)" })
hl.bind(
	"Print",
	hl.dsp.exec_cmd(screenshot),
	{ description = "Runs " .. screenshot .. ", but in a different key (Screenshot)" }
)

-- Window
hl.bind(mod .. " + X", hl.dsp.window.close(), { description = "Closes a window" })
hl.bind(mod .. " + Z", hl.dsp.window.float({ action = "toggle" }), { description = "Makes a window floating" })
hl.bind(mod .. " + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.window.move({ direction = "down" }))

-- System
hl.bind(mod .. " + Grave", hl.dsp.exec_cmd(powerMenu), { description = "Runs " .. powerMenu .. " (Power Menu)" })

-- Workspaces
local workspaceKeybind =
	{ "KP_End", "KP_Down", "KP_Next", "KP_Left", "KP_Begin", "KP_Right", "KP_Home", "KP_Up", "KP_Prior", "KP_Insert" }

for i = 1, 10 do
	local key = workspaceKeybind[i]
	hl.bind(
		mod .. " + " .. key,
		hl.dsp.focus({ workspace = i }),
		{ description = "Changes focus of workspace based on given keybind" }
	)
	hl.bind(
		mod .. " + SHIFT + " .. key,
		hl.dsp.window.move({ workspace = i }),
		{ description = "Moves window to workspace based on given keybind" }
	)
end

-- FXX Keys
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume raise"),
	{ locked = true, repeating = true, description = "Raises volume" }
)

hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume lower"),
	{ locked = true, repeating = true, description = "Lowers volume" }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"),
	{ locked = true, repeating = true, description = "Mutes volume" }
)
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("swayosd-client --brightness raise"),
	{ locked = true, repeating = true, description = "Raises brightness" }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("swayosd-client --brightness lower"),
	{ locked = true, repeating = true, description = "Lowers brightness" }
)
