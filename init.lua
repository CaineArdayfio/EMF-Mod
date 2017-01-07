--item: veggie-burger
minetest.register_craftitem("emf:veggie_burger", {
	description = "Veggie-Burger(FULL HEALTH!)",
	inventory_image = "hamburger.png",
	on_use = function(itemstack, user, pointed_thing)
		hp_change = 20
		replace_with_item = nil

		minetest.chat_send_player(user:get_player_name(), "You ate a Veggie-Burger!")

		-- Support for hunger mods using minetest.register_on_item_eat
		for _ , callback in pairs(minetest.registered_on_item_eats) do
			local result = callback(hp_change, replace_with_item, itemstack, user, pointed_thing)
			if result then
				return result
			end
		end

		if itemstack:take_item() ~= nil then
			user:set_hp(user:get_hp() + hp_change)
		end

		return itemstack
	end
	})


--craft: veggie burger
minetest.register_craft({
	output = "emf:veggie_burger",
	recipe = {
		{"","emf:bread",""},
		{"emf:cooked_mushroom","emf:ketchup","emf:lettuce"},
		{"","emf:bread",""}
	}
})

--item: lettuce
minetest.register_craftitem("emf:lettuce", {
description = "Lettuce",
inventory_image = "lettuce.png",
on_use = minetest.item_eat(2)
})

--craft: lettuce
minetest.register_craft({
	type = "shapeless",
	output = "emf:lettuce",
	recipe = {"farming:wheat","dye:dark_green"}
})

--item: ketchup
minetest.register_craftitem("emf:ketchup", {
description = "Ketchup?",
inventory_image = "ketchup.png",
on_use = minetest.item_eat(0)
})

--craft: ketchup
minetest.register_craft({
	type = "shapeless",
	output = "emf:ketchup",
	recipe = {"default:apple" ,"vessels:glass_bottle"}
})

--item: apple juice
minetest.register_craftitem("emf:apple_juice", {
description = "Apple Juice",
inventory_image = "apple_juice.png",
on_use = minetest.item_eat(7)
})

--craft: apple juice
minetest.register_craft({
	type = "shapeless",
	output = "emf:apple_juice",
	recipe = {"default:apple","default:apple","vessels:drinking_glass"}
})

--item: bowl
minetest.register_craftitem("emf:bowl", {
description = "Bowl",
inventory_image = "bowl.png"
})

--craft: bowl
minetest.register_craft({
	output = "emf:bowl",
	recipe = {
	{"default:wood","","default:wood"},
	{"","default:wood",""}
	}
})

--item: dandelion soup
minetest.register_craftitem("emf:dandelion_soup", {
description = "Dandelion Soup",
inventory_image = "dandelionsoup.png",
on_use = minetest.item_eat(14)
})

--craft: dandelion soup
minetest.register_craft({
	output = "emf:dandelion_soup",
	recipe = {
	{"emf:cooked_mushroom","flowers:dandelion_white","farming:seed_wheat"},
	{"flowers:dandelion_yellow","emf:bowl",""}
	}
})

--item: bread
minetest.register_craftitem("emf:bread", {
	description = "Toasted Bread",
	inventory_image = "bread.png",
	on_use = minetest.item_eat(3)
})

--furnace: bread
minetest.register_craft({
	type = "cooking",
	output = "emf:bread",
	recipe = "farming:bread",
	cooktime = 2,
})

--item: mushroom
minetest.register_craftitem("emf:cooked_mushroom", {
	description = "Cooked Mushroom",
	inventory_image = "cooked_mushroom.png",
	on_use = minetest.item_eat(6)
})

--furnace: mushroom
minetest.register_craft({
  type = "cooking",
	output = "emf:cooked_mushroom",
	recipe = "flowers:mushroom_brown",
	cooktime = 6
})
