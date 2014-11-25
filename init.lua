minetest.register_node("mese_fence:mese_fence", {
	description="Mese Fence - A fence that conducts electrecity.",
	drawtype = "fencelike",
	tiles = {"mese_fence.png"},
	inventory_image = "mese_fence_inv.png",
	wield_image = "mese_fence_inv.png",
	paramtype = "light",
	selection_box = {
	        type = "fixed",
	        fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {snappy=3},
	drop = 'mese_fence:mese_fence',
	walkable = true,
	mesecons = {conductor = {
		state = mesecon.state.off,
		rules = {
			{x = -1, y = 0, z = 0},
			{x = 1, y = 0, z = 0},
			{x = 0, y = -1, z = 0},
			{x = 0, y = 1, z = 0},
			{x = 0, y = 0, z = -1},
			{x = 0, y = 0, z = 1},
		},
		onstate = "mese_fence:mese_fence_active",
	}}
})

minetest.register_node("mese_fence:mese_fence_active", {
	drawtype = "fencelike",
	tiles = {"mese_fence.png^mese_fence_active.png"},
	paramtype = "light",
	selection_box = {
	        type = "fixed",
	        fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {snappy=3},
	drop = 'mese_fence:mese_fence',
	walkable = true,
	mesecons = {conductor = {
		state = mesecon.state.on,
		rules = {
			{x = -1, y = 0, z = 0},
			{x = 1, y = 0, z = 0},
			{x = 0, y = -1, z = 0},
			{x = 0, y = 1, z = 0},
			{x = 0, y = 0, z = -1},
			{x = 0, y = 0, z = 1},
		},
		offstate = "mese_fence:mese_fence",
	}}
})

minetest.register_craft({
	output = 'mese_fence:mese_fence 4',
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"group:stick", "group:mesecon_conductor_craftable", "group:stick"},
		{"group:stick", "default:steel_ingot", "group:stick"},
	}
})

-- An alias to make things easier.
minetest.register_alias('mese_fence', 'mese_fence:mese_fence')

-- Backwards compatibility.
dofile(minetest.get_modpath("mese_fence").."/legacy.lua");

-- Mod loaded message.
print('[mese_fence] loaded.')

