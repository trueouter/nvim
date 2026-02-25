-- Instantly detect system theme (Dark/Light) before any UI renders to prevent flash
local function get_system_theme()
  local os_name = vim.loop.os_uname().sysname
  if os_name == "Darwin" then
    local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
    if handle then
      local result = handle:read("*a")
      handle:close()
      if result:match("Dark") then return "dark" end
    end
  elseif os_name == "Windows_NT" then
    local handle = io.popen('reg query "HKCU\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Themes\\Personalize" /v AppsUseLightTheme 2>nul')
    if handle then
      local result = handle:read("*a")
      handle:close()
      if result:match("0x0") then return "dark" end -- 0 means dark mode in Windows
    end
  else
    -- Linux Desktop (GNOME/GTK)
    local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null")
    if handle then
      local result = handle:read("*a")
      handle:close()
      if result:match("prefer%-dark") then return "dark" end
    end
  end
  return "light" -- fallback
end

return get_system_theme()
