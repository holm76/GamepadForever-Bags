local addonName, addon = ...
local inventory = ContainerFrameCombinedBags
if not inventory then return end

local function mergeLocalization(english, selected)
    selected = selected or {}
    local localization = {}
    for key, englishValue in pairs(english) do
        local selectedValue = selected[key]
        if type(englishValue) == "table" then
            localization[key] = mergeLocalization(englishValue, selectedValue)
        else
            localization[key] = selectedValue or englishValue
        end
    end
    return localization
end

local events = CreateFrame("Frame")
events:RegisterEvent("ADDON_LOADED")
events:SetScript("OnEvent", function(self, _, loadedAddon)
    if loadedAddon ~= addonName then return end
    self:UnregisterEvent("ADDON_LOADED")

    local locale = GetLocale()
    local language = locale:sub(1, 2):upper()
    local localizations = addon.localization
    local selected = localizations[locale] or localizations[language]
    local localization = mergeLocalization(localizations.EN, selected)

    local db = addon.RegisterSettings(localization.Settings)
    addon.RegisterBags(inventory, db)
end)
