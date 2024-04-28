/datum/verbs/menu/Preferences/verb/open_character_preferences()
	set category = "OOC"
	set name = "Открыть настройки Персонажа"
	set desc = "Открыть настройки Персонажа"

	var/datum/preferences/preferences = usr?.client?.prefs
	if (!preferences)
		return

	preferences.current_window = PREFERENCE_TAB_CHARACTER_PREFERENCES
	preferences.update_static_data(usr)
	preferences.ui_interact(usr)

/datum/verbs/menu/Preferences/verb/open_game_preferences()
	set category = "OOC"
	set name = "Открыть настройки Игры"
	set desc = "Открыть настройки Игры"

	var/datum/preferences/preferences = usr?.client?.prefs
	if (!preferences)
		return

	preferences.current_window = PREFERENCE_TAB_GAME_PREFERENCES
	preferences.update_static_data(usr)
	preferences.ui_interact(usr)

