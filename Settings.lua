local _, addon = ...

function addon.RegisterSettings(localization)
    if type(ForeverBagSectionsSettings) ~= "table" then
        ForeverBagSectionsSettings = {}
    end
    local db = ForeverBagSectionsSettings

    local general = localization.General
    local category = Settings.RegisterVerticalLayoutCategory("Gamepad Forever: Bags")
    local setting = Settings.RegisterAddOnSetting(category, "FOREVER_BAG_SECTIONS_AUTO_SORT_ON_OPEN",
        "autoSortOnOpen", db, Settings.VarType.Boolean, general.autoSortOnOpen, false)
    Settings.CreateCheckbox(category, setting, general.autoSortOnOpenTooltip)
    Settings.RegisterAddOnCategory(category)
    return db
end
