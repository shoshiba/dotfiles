local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- カラースキームの設定
config.color_scheme = 'MaterialOcean'
-- 背景透過
config.window_background_opacity = 0.90


-- mac用設定
local mac = wezterm.target_triple:find("darwin")

if mac then
  -- フォントの設定
  config.font = wezterm.font("Hackgen Console NF", {weight="Medium", stretch="Normal", style="Normal"})
  -- フォントサイズの設定
  config.font_size = 16
  -- ショートカットキー設定
  local act = wezterm.action
  config.keys = {
    -- Alt(Opt)+Shift+Fでフルスクリーン切り替え
    {
      key = 'f',
      mods = 'SHIFT|META',
      action = wezterm.action.ToggleFullScreen,
    },
    -- Ctrl+Shift+tで新しいタブを作成
    {
      key = 't',
      mods = 'SHIFT|CTRL',
      action = act.SpawnTab 'CurrentPaneDomain',
    },
    -- Ctrl+Shift+dで新しいペインを作成(画面を分割)
--    {
--      key = '|',
--      mods = 'LEADER',
--      action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
--    },
  }
  
--  config.leader = { key="a", mods="CTRL", timeout_milliseconds=1000 }
end
return config

