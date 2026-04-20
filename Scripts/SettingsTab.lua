local STheme = "Default"
local ThemeSD = SettingsT:CreateDropdown({
   Name = "Select Theme",
   Options = {"Default", "AmberGlow", "Amethyst", "Bloom", "DarkBlue", "Green", "Light", "Ocean", "Serenity"},
   CurrentOption = {"Default"},
   MultipleOptions = false,
   Flag = "SelectedTheme",
   Callback = function(Options)
   if type(Options) == "table" then
        STheme = Options[1] or "Default"
      else
        STheme = Options
      end
   end,
})
local ThemeB = SettingsT:CreateButton({
   Name = "Set Theme",
   Callback = function()
   Window.ModifyTheme(STheme)
   end,
})
