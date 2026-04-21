local SettingsT = Window:CreateTab("Settings", "settings")

local STheme = "Default"
local BasicTS = SettingsT:CreateSection("Basic Themes")
local ThemeSD = SettingsT:CreateDropdown({
   Name = "Select Theme",
   Options = {"Default", "AmberGlow", "Amethyst", "Bloom", "DarkBlue", "Green", "Light", "Ocean", "Serenity"},
   CurrentOption = "Default",
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

local CustomTS = SettingsT:CreateSection("Custom Themes")
local CustomTheme = {
	TextColor = Color3.fromRGB(240, 240, 240),

	Background = Color3.fromRGB(25, 25, 25),
	Topbar = Color3.fromRGB(34, 34, 34),
	Shadow = Color3.fromRGB(20, 20, 20),

	NotificationBackground = Color3.fromRGB(20, 20, 20),
	NotificationActionsBackground = Color3.fromRGB(230, 230, 230),

	TabBackground = Color3.fromRGB(80, 80, 80),
	TabStroke = Color3.fromRGB(85, 85, 85),
	TabBackgroundSelected = Color3.fromRGB(210, 210, 210),
	TabTextColor = Color3.fromRGB(240, 240, 240),
	SelectedTabTextColor = Color3.fromRGB(50, 50, 50),

	ElementBackground = Color3.fromRGB(35, 35, 35),
	ElementBackgroundHover = Color3.fromRGB(40, 40, 40),
	SecondaryElementBackground = Color3.fromRGB(25, 25, 25),
	ElementStroke = Color3.fromRGB(50, 50, 50),
	SecondaryElementStroke = Color3.fromRGB(40, 40, 40),

	SliderBackground = Color3.fromRGB(50, 138, 220),
	SliderProgress = Color3.fromRGB(50, 138, 220),
	SliderStroke = Color3.fromRGB(58, 163, 255),

	ToggleBackground = Color3.fromRGB(30, 30, 30),
	ToggleEnabled = Color3.fromRGB(0, 146, 214),
	ToggleDisabled = Color3.fromRGB(100, 100, 100),
	ToggleEnabledStroke = Color3.fromRGB(0, 170, 255),
	ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
	ToggleEnabledOuterStroke = Color3.fromRGB(100, 100, 100),
	ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),

	DropdownSelected = Color3.fromRGB(40, 40, 40),
	DropdownUnselected = Color3.fromRGB(30, 30, 30),

	InputBackground = Color3.fromRGB(30, 30, 30),
	InputStroke = Color3.fromRGB(65, 65, 65),
	PlaceholderColor = Color3.fromRGB(178, 178, 178)
}
local currentProperty = "TextColor"
local SelectPropertyD = SettingsT:CreateDropdown({
   Name = "Select Property",
   Options = {"TextColor", "Background","Topbar","Shadow","NotificationBackground","NotificationActionsBackground","TabBackground","TabStroke","TabTextColor","TabBackgroundSelected","SelectedTabTextColor","ElementBackground","SecondaryElementBackground","ElementBackgroundHover","ElementStroke","SecondaryElementStroke","SliderBackground","SliderProgress","SliderStroke","ToggleBackground","ToggleEnabled","ToggleDisabled","ToggleEnabledStroke","ToggleDisabledStroke","ToggleEnabledOuterStroke","ToggleDisabledOuterStroke","DropdownSelected","DropdownUnselected","InputBackground","InputStroke","PlaceholderColor"},
   CurrentOption = "TextColor",
   MultipleOptions = false,
   Flag = "SelectedProperty", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
   if type(Options) == "table" then
        currentProperty = Options[1] or "TextColor"
      else
        currentProperty = Options
      end
   end,
})
local ColorChangeCP = SettingsT:CreateColorPicker({
    Name = "Custom Property Color",
    Color = Color3.fromRGB(240,240,240),
    Flag = "ColorChange",
    Callback = function(Value)
    CustomTheme[currentProperty] = Value
    end
})
local ThemeCustomB = SettingsT:CreateButton({
   Name = "Set Custom Theme",
   Callback = function()
   Window.ModifyTheme(CustomTheme)
   end,
})
