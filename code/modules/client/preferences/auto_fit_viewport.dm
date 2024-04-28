/datum/preference/toggle/auto_fit_viewport
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "auto_fit_viewport"
	savefile_identifier = PREFERENCE_PLAYER

/datum/preference/toggle/auto_fit_viewport/apply_to_client_updated(client/client, value)
	INVOKE_ASYNC(client, /client/verb/fit_viewport)



/datum/preference/numeric/bloom
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "bloom_amount"
	savefile_identifier = PREFERENCE_PLAYER
	minimum = 0
	maximum = 100

/datum/preference/numeric/bloom/create_default_value()
	return round((ADDITIVE_LIGHTING_PLANE_ALPHA_NORMAL / 255) * 100)

/datum/preference/numeric/bloom/apply_to_client(client/client, value)
	client.mob?.update_sight()

/atom/movable/screen/plane_master/additive_lighting
	name = "additive lighting plane master"
	plane = LIGHTING_PLANE_ADDITIVE
	blend_mode_override = BLEND_ADD
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
