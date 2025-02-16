-- adapted from: https://github.com/m1chaelwilliams/make-windows-pretty/blob/main/.wezterm.lua

local wezterm = require("wezterm")
local act = wezterm.action
-- local mux = wezterm.mux
local config = wezterm.config_builder()

-- local gpus = wezterm.gui.enumerate_gpus()
-- config.webgpu_preferred_adapter = gpus[1]
-- config.front_end = "WebGpu"

config.front_end = "OpenGL"
config.max_fps = 144
config.default_cursor_style = "BlinkingBlock"
config.animation_fps = 1
config.cursor_blink_rate = 500
config.term = "xterm-256color" -- Set the terminal type
-- config.default_domain = 'WSL:Ubuntu'
config.font = wezterm.font("CaskaydiaMono Nerd Font")
config.cell_width = 0.9
config.window_background_opacity = 1.0
config.prefer_egl = true
config.font_size = 12.0

config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 20,
}

-- tabs
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false

config.launch_menu = {
  {
    label = "PowerShell",
    args = { 'powershell.exe', '-NoLogo' },
  },
  {
    label = 'WSL Ubuntu',
    -- The argument array to spawn.  If omitted the default program
    -- will be used as described in the documentation above
    args = { 'wsl.exe', '-d', 'Ubuntu' },

    -- You can specify an alternative current working directory;
    -- if you don't specify one then a default based on the OSC 7
    -- escape sequence will be used (see the Shell Integration
    -- docs), falling back to the home directory.
    -- cwd = "/some/path"

    -- You can override environment variables just for this command
    -- by setting this here.  It has the same semantics as the main
    -- set_environment_variables configuration option described above
    -- set_environment_variables = { FOO = "bar" },
  },
}

config.inactive_pane_hsb = {
	saturation = 0.0,
	brightness = 1.0,
}

-- color scheme toggling
wezterm.on("toggle-colorscheme", function(window, pane)
  local overrides = window:get_config_overrides() or {}
  if overrides.color_scheme == "Zenburn" then
    overrides.color_scheme = "Cloud (terminal.sexy)"
  else
    overrides.color_scheme = "Zenburn"
  end
  window:set_config_overrides(overrides)
end)

-- keymaps
config.keys = {
  {
    key = "K",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.EmitEvent("toggle-colorscheme"),
  },
  {
    key = "h",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.SplitPane({
      direction = "Right",
      size = { Percent = 50 },
    }),
  },
  {
    key = "v",
    mods = "CTRL|SHIFT|ALT",
    action = wezterm.action.SplitPane({
      direction = "Down",
      size = { Percent = 50 },
    }),
  },
  {
    key = "U",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize({ "Left", 5 }),
  },
  {
    key = "I",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize({ "Down", 5 }),
  },
  {
    key = "O",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize({ "Up", 5 }),
  },
  {
    key = "P",
    mods = "CTRL|SHIFT",
    action = act.AdjustPaneSize({ "Right", 5 }),
  },
  { key = "9", mods = "CTRL", action = act.PaneSelect },
  { key = "L", mods = "CTRL", action = act.ShowDebugOverlay },
  {
    key = "O",
    mods = "CTRL|ALT",
    -- toggling opacity
    action = wezterm.action_callback(function(window, _)
      local overrides = window:get_config_overrides() or {}
      if overrides.window_background_opacity == 1.0 then
        overrides.window_background_opacity = 0.9
      else
        overrides.window_background_opacity = 1.0
      end
      window:set_config_overrides(overrides)
    end),
  },
  { key = 'l', mods = 'CTRL', action = wezterm.action.ShowLauncher },
}

config.mouse_bindings = {
  {
    event = { Drag = { streak = 1, button = 'Left' } },
    mods = 'SUPER',
    action = wezterm.action.StartWindowDrag,
  },
  {
    event = { Drag = { streak = 1, button = 'Left' } },
    mods = 'CTRL|SHIFT',
    action = wezterm.action.StartWindowDrag,
  },
}

-- For example, changing the color scheme:
config.color_scheme = "Alabaster"
config.colors = {
  -- background = '#3b224c',
  -- background = "#181616", -- vague.nvim bg
  -- background = "#080808", -- almost black
  -- background = "#0c0b0f", -- dark purple
  -- background = "#020202", -- dark purple
  -- background = "#17151c", -- brighter purple
  -- background = "#16141a",
  -- background = "#0e0e12", -- bright washed lavendar
  -- background = 'rgba(59, 34, 76, 100%)',
  -- cursor_border = "#bea3c7",
  -- cursor_fg = "#281733",
  cursor_bg = "#eba0ac",
  -- selection_fg = '#281733',
  selection_bg = "#eba0ac",

  tab_bar = {
    background = "#0c0b0f",
    -- background = "rgba(0, 0, 0, 0%)",
    active_tab = {
      bg_color = "#0c0b0f",
      fg_color = "#bea3c7",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = "#0c0b0f",
      fg_color = "#f8f2f5",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },

    new_tab = {
      -- bg_color = "rgba(59, 34, 76, 50%)",
      bg_color = "#0c0b0f",
      fg_color = "white",
    },
  },
}

config.window_frame = {
  font = wezterm.font({
    family = "CaskaydiaMono Nerd Font",
    weight = "Regular",
  }),
  active_titlebar_bg = "#0c0b0f",
}

-- config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.window_decorations = "NONE | RESIZE"
config.default_prog = { "powershell.exe", "-NoLogo" }
config.initial_cols = 80
-- config.window_background_image = "~/wallpaper.png"
-- config.window_background_image_hsb = {
-- 	brightness = 0.1,
-- }

-- wezterm.on("gui-startup", function(cmd)
-- 	local args = {}
-- 	if cmd then
-- 		args = cmd.args
-- 	end
--
-- 	local tab, pane, window = mux.spawn_window(cmd or {})
-- 	-- window:gui_window():maximize()
-- 	-- window:gui_window():set_position(0, 0)
-- end)

return config
