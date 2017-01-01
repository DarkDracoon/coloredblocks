local colors = {
	{"red", "Red"},
	{"yellow", "Yellow"},
	{"green", "Green"},
	{"cyan", "Cyan"},
	{"blue", "Blue"},
	{"magenta", "Magenta"},
	{"brown", "Brown"},
	{"black", "Black"},
	{"white", "White"},
}

for i in ipairs(colors) do
	local tophalf = colors[i][1]
	for j in ipairs(colors) do
		local bottomhalf = colors[j][1]
		if tophalf ~= bottomhalf then

			minetest.register_node("coloredblocks:"..tophalf..bottomhalf, {
				description = colors[i][2].."-"..colors[j][2].." Block",
				tiles = {
					"coloredblocks_"..tophalf..".png",
					"coloredblocks_"..bottomhalf..".png",
					"coloredblocks_"..bottomhalf.."half.png^[transformR180^coloredblocks_"..tophalf.."half.png"
				},
				groups = {cracky = 1},
			})

			minetest.register_craft({
				output = "coloredblocks:"..tophalf..bottomhalf.." 2",
				recipe = {
					{ "coloredblocks:"..tophalf },
					{ "coloredblocks:"..bottomhalf }
				}
			})
		else

			-- top and bottom halves are the same, so just register a whole-color block + recipe instead.

			minetest.register_node("coloredblocks:"..tophalf, {
				description = colors[i][2].." Block",
				tiles = {
					"coloredblocks_"..tophalf..".png",
				},
				groups = {cracky = 1},
			})

			minetest.register_craft({
				output = "coloredblocks:"..tophalf.." 5",
				recipe = {
					{ "", "default:glass", "" },
					{ "default:glass", "wool:"..tophalf, "default:glass" },
					{ "", "default:glass", "" },
					
				}
			})
		end
	end
end

