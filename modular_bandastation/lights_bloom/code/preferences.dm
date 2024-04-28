/datum/preference/choiced/exposurelevel
	main_feature_name = "Exposure strength"
	savefile_key = "exposure_level"
	savefile_identifier = PREFERENCE_PLAYER
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES

/datum/preference/choiced/exposurelevel/init_possible_values()
	return list(BLOOM_LEVEL_OFF, BLOOM_LEVEL_LOW, BLOOM_LEVEL_MEDIUM, BLOOM_LEVEL_HIGH)

/datum/preference/choiced/exposurelevel/create_default_value()
	return BLOOM_LEVEL_HIGH

/datum/preference/choiced/exposurelevel/apply_to_client_updated(client/client, value)
	if(!ishuman(client.mob))
		return
	var/atom/movable/screen/exposure/exposure_to_update
	exposure_to_update.UpdateRenderer()

/datum/preference/choiced/bloomlevel
	savefile_key = "bloom_level"
	savefile_identifier = PREFERENCE_PLAYER
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES

/datum/preference/choiced/bloomlevel/init_possible_values()
	return list(BLOOM_LEVEL_OFF, BLOOM_LEVEL_LOW, BLOOM_LEVEL_MEDIUM, BLOOM_LEVEL_HIGH)

/datum/preference/choiced/bloomlevel/create_default_value()
	return BLOOM_LEVEL_MEDIUM

/datum/preference/choiced/bloomlevel/apply_to_client_updated(client/client, value)
	if(!ishuman(client.mob))
		return
	var/atom/movable/screen/lamps/lamps_to_update
	lamps_to_update.UpdateRenderer()

/datum/preference/toggle/glare
	savefile_key = "glare"
	savefile_identifier = PREFERENCE_PLAYER
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES

/datum/preference/toggle/glare/apply_to_client(client/client, value)
	if(!ishuman(client.mob))
		return
	var/atom/movable/screen/lamps_glare/glare_to_update
	glare_to_update.UpdateRenderer()
