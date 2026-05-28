local mainMod = "SUPER" -- Sets "Windows" key as main modifier

hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("foot"))
hl.bind(mainMod .. " + X", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("thunar"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("fuzzel"))
hl.bind(mainMod .. " + N", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("stash list | fuzzel -d -w 75 -l 20 | stash decode | wl-copy"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("flameshot gui"))
hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))
hl.bind("Grave", hl.dsp.exec_cmd("pkill wleave || wleave"))

hl.bind(mainMod .. " + KP_End", hl.dsp.focus({ workspace = 1 }))
hl.bind(mainMod .. " + KP_Down", hl.dsp.focus({ workspace = 2 }))
hl.bind(mainMod .. " + KP_Next", hl.dsp.focus({ workspace = 3 }))
hl.bind(mainMod .. " + KP_Left", hl.dsp.focus({ workspace = 4 }))
hl.bind(mainMod .. " + KP_Begin", hl.dsp.focus({ workspace = 5 }))
hl.bind(mainMod .. " + KP_Right", hl.dsp.focus({ workspace = 6 }))
hl.bind(mainMod .. " + KP_Home", hl.dsp.focus({ workspace = 7 }))
hl.bind(mainMod .. " + KP_Up", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + KP_Prior", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + KP_Insert", hl.dsp.focus({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + KP_End", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + KP_Down", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + KP_Next", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + KP_Left", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + KP_Begin", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + KP_Right", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + KP_Home", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + KP_Up", hl.dsp.focus({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + KP_Prior", hl.dsp.focus({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + KP_Insert", hl.dsp.focus({ workspace = 10 }))

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume raise"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("swayosd-client --output-volume lower"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("swayosd-client --output-volume mute-toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessUp",
	hl.dsp.exec_cmd("swayosd-client --brightness raise"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86MonBrightnessDown",
	hl.dsp.exec_cmd("swayosd-client --brightness lower"),
	{ locked = true, repeating = true }
)
