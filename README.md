# Gamepad Forever: Bags

Gamepad Forever: Bags stacks each bag in its own section inside the combined inventory in WoW Forever. The sections use WoW's item slots and bag buttons. In gamepad mode, the combined bag icon opens the menu with WoW's sort command.

## Installation

The addon works in combined bags mode. After installing, restart WoW and enable **Gamepad Forever: Bags** under **Gamepad Forever** in the AddOns list.

## Settings

Open **Settings → AddOns → Gamepad Forever: Bags** to enable **Sort bags on open**. The setting is off by default. When enabled, WoW sorts the combined bags each time you open them out of combat.

## Addon structure

- `Addon.lua` selects the interface language and initializes settings before registering the bag logic.
- `Settings.lua` registers the options in WoW and returns the saved settings table.
- `Bags.lua` lays out the bag sections, updates gamepad navigation, and handles automatic sorting.
- `Localization/` contains English and Russian translations. WoW's interface language selects the translation, with English as the fallback.
