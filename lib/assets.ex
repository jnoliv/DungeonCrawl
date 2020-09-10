defmodule Assets do
	alias Character

	def welcome_message() do
		"
=== DUNGEON CRAWL ===

You awake in what looks like a dungeon
It's quite dark and you don't remember how you got here
You must survive and find your way to the surface\n\n"
	end

	def heroes do
		[%Character{
			name: "Warrior",
			description: "Good HP and consistent damage output, your typical brute",
			attack_description: "Axe cleave",
			hp: 18,
			max_hp: 18,
			attack_range: 4..6
		},
		%Character{
			name: "Rogue",
			description: "Medium HP and wildly variable damage output, your typical sneaky stabby fella",
			attack_description: "Dagger slash",
			hp: 12,
			max_hp: 12,
			attack_range: 1..10
		},
		%Character{
			name: "Wizzard",
			description: "Squishy but high damage output, your typical glasscannon",
			attack_description: "",
			hp: 8,
			max_hp: 8,
			attack_range: 6..10
		}]
	end
end
