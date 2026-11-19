# Gamepad Forever: Bags

Gamepad Forever: Bags stacks each bag in its own section inside the combined inventory in WoW Forever. The sections use WoW's item slots and bag buttons. In gamepad mode, the combined bag icon opens the menu with WoW's sort command.

## Installation

The addon works in combined bags mode. After installing, restart WoW and enable **Gamepad Forever: Bags** under **Gamepad Forever** in the AddOns list.

## Settings

Open **Settings → AddOns → Gamepad Forever: Bags** to enable **Sort bags on open**. The setting is off by default. When enabled, WoW sorts the combined bags each time you open them out of combat.

## Gamepad navigation

In gamepad mode, the addon extends WoW's controller navigation inside the combined bags:

- **Cursor memory:** the inventory reopens on the item slot or bag slot you last focused. The position is saved per character, so it survives `/reload` and logging out. If that bag shrank, focus goes to the nearest slot in it; if the bag is gone or collapsed, WoW's default focus is used.
- **Preferred column:** Up and Down keep the column you were heading for across bags of different sizes. From cell 9, Down into a 6-slot bag lands on cell 6, and Down again returns to cell 9. Moving Left or Right sets a new column.
- **Wrapping:** Down from the bottom row returns to the top row in your column, and Up from the top row goes to the bottom row. Empty and collapsed bag slots are part of the rows, so Up and Down stop on them.
- **Bag slot column:** in the bag slot column, Up and Down move between bag slots. A bag slot reached from the items keeps following the item rows; one reached along the column follows the column.
- **Reading order:** at the ends of a row and on bag slots, Left and Right move through the bags in reading order: each bag slot, then its items row by row, then the next bag slot.

Everything works in combat without blocked-action messages, and no key bindings are added. The navigation uses SmartNavigation's own jump overrides (`SmartNavigation_AddJumpNavigationOverride`, with static buttons only) on the focused button, and the cursor is restored through `SmartNavigation:SetTargetButtonForFrame`. Both are only changed outside combat restrictions.

## Addon structure

- `Addon.lua` selects the interface language and initializes settings before registering the bag logic.
- `Settings.lua` registers the options in WoW and returns the saved settings table.
- `Bags.lua` lays out the bag sections, updates gamepad navigation, and handles automatic sorting. `addon.RegisterBagsListener` lets the modules below follow each layout, navigation refresh, close and the end of combat.
- `SelectionMemory.lua` remembers the last focused item slot or bag slot per character (`GamepadForeverBagsCharacter`) and restores it when the inventory opens.
- `Navigation.lua` adds the preferred column, wrapping, the bag slot column and reading-order Left/Right.
- `Localization/` contains English, French, German, Portuguese, Russian, and Spanish translations. WoW's interface language selects the translation, with English as the fallback.
