local _, addon = ...
local SETTING_PREFIX = "GAMEPAD_FOREVER_BAGS_"

function addon.RegisterSettings(localization)
    if type(GamepadForeverBagsSettings) ~= "table" then
        GamepadForeverBagsSettings = {}
    end
    local db = GamepadForeverBagsSettings

    local general = localization.General
    local category = Settings.RegisterVerticalLayoutCategory("Gamepad Forever: Bags")
    local setting = Settings.RegisterAddOnSetting(category, SETTING_PREFIX .. "AUTO_SORT_ON_OPEN",
        "autoSortOnOpen", db, Settings.VarType.Boolean, general.autoSortOnOpen, false)
    Settings.CreateCheckbox(category, setting, general.autoSortOnOpenTooltip)
    Settings.RegisterAddOnCategory(category)
    return db
end
