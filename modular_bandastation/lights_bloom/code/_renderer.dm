/atom/movable/screen/exposure
	name = "Lighting Exposure"
	plane = LIGHTING_EXPOSURE_PLANE
	blend_mode = BLEND_ADD
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = PLANE_MASTER|PIXEL_SCALE // should use client color

/atom/movable/screen/exposure/proc/Setup(datum/hud/hud_owner)
	filters = list()

	var/mob/M = hud_owner?.mymob
	if(istype(M))
		var/level = M.client?.prefs?.read_preference(/datum/preference/choiced/exposurelevel)
		var/alpha = 255
		if(level == BLOOM_LEVEL_OFF)
			alpha *= 0
		else if(level == BLOOM_LEVEL_LOW)
			alpha *= 0.33
		else if(level == BLOOM_LEVEL_MEDIUM)
			alpha *= 0.66

		filters += filter(
			type = "color",
			color = rgb(255, 255, 255, alpha)
		)

		if(level == BLOOM_LEVEL_OFF)
			return

	filters += filter(
		type = "blur",
		size = 20
	)

/atom/movable/screen/exposure/proc/UpdateRenderer(datum/hud/hud_owner)
	Setup(hud_owner)

/atom/movable/screen/exposure/Initialize(datum/hud/hud_owner)
	. = ..()
	Setup(hud_owner)

/atom/movable/screen/lamps
	name = "Lamps Plane Master"
	plane = LIGHTING_LAMPS_PLANE
	blend_mode = BLEND_ADD
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = PLANE_MASTER // should use client color

/atom/movable/screen/lamps/proc/Setup(datum/hud/hud_owner)
	filters = list()

	var/bloomsize = 0
	var/bloomoffset = 0

	var/mob/M = hud_owner?.mymob
	if(istype(M))
		var/level = M.client?.prefs?.read_preference(/datum/preference/choiced/bloomlevel)
		if(level == BLOOM_LEVEL_OFF)
			return
		else if(level == BLOOM_LEVEL_LOW)
			bloomsize = 2
			bloomoffset = 1
		else if(level == BLOOM_LEVEL_MEDIUM)
			bloomsize = 3
			bloomoffset = 2
		else if(level == BLOOM_LEVEL_HIGH)
			bloomsize = 5
			bloomoffset = 3

	filters += filter(
		type = "bloom",
		threshold = "#aaaaaa",
		size = bloomsize,
		offset = bloomoffset,
		alpha = 100
	)

/atom/movable/screen/lamps/proc/UpdateRenderer(datum/hud/hud_owner)
	Setup(hud_owner)

/atom/movable/screen/lamps/Initialize(datum/hud/hud_owner)
	. = ..()
	Setup(hud_owner)

/atom/movable/screen/lamps_glare
	name = "Lamps Glare Plane Master"
	plane = LIGHTING_LAMPS_GLARE
	blend_mode = BLEND_OVERLAY
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	appearance_flags = PLANE_MASTER // should use client color

/atom/movable/screen/lamps_glare/proc/Setup(datum/hud/hud_owner)
	filters = list()

	var/mob/M = hud_owner?.mymob
	if(istype(M))
		var/enabled = M.client?.prefs?.read_preference(/datum/preference/toggle/glare)
		if(enabled == BLOOM_LEVEL_OFF)
			filters += filter(
				type = "color",
				color = "#00000000"
			)
			return

	filters += filter(
		type = "radial_blur",
		size = 0.03
	)

/atom/movable/screen/lamps_glare/proc/UpdateRenderer(datum/hud/hud_owner)
	Setup(hud_owner)

/atom/movable/screen/lamps_glare/Initialize(mapload, datum/hud/hud_owner)
	. = ..()
	Setup(hud_owner)
