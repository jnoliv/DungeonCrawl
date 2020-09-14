defmodule Assets do
	alias Character
	alias Action.{Forward, Heal}

	def welcome_message() do
		"
=== DUNGEON CRAWL ===

You awake in what looks like a dungeon
It's quite dark and you don't remember how you got here
You must survive and find your way to the surface

"
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
			attack_description: "Dagger stab",
			hp: 12,
			max_hp: 12,
			attack_range: 1..10
		},
		%Character{
			name: "Wizzard",
			description: "Squishy but high damage output, your typical glasscannon",
			attack_description: "Fireball",
			hp: 8,
			max_hp: 8,
			attack_range: 6..10
		}]
	end

	def enemies do
		[%Character{
			name: "Goblin",
			description: "Small, fragile creature, usually found in large packs. Luckily for you, this one is alone",
			attack_description: "Dagger thrust",
			hp: 4,
			max_hp: 4,
			attack_range: 1..2
		},
		%Character{
			name: "Orc",
			description: "A human sized, battle hardened creature. Not as dumb as the goblins, despite being quite as ugly",
			attack_description: "Sword slash",
			hp: 8,
			max_hp: 8,
			attack_range: 2..4
		},
		%Character{
			name: "Ogre",
			description: "A bulky greenish creature, with veins popping out of every muscle in its body. Also ugly",
			attack_description: "Warhammer swing",
			hp: 12,
			max_hp: 12,
			attack_range: 3..5
		}]
	end

	def rooms do
		[%Room{
			description: "You enter a wide, square, well lit room. All four walls are lined with bookshelves, filled with old, dusty tomes. You think about resting for a while and browsing through the books, but you decide against it. There's no time to lose!",
			actions: [
				{Forward, "Move to the next room, whatever it takes!"},
				{Heal, "Heal before engaging the creature!"}],
			trigger: :enemy
		},
		%Room{
			description: "As you cross the doorway, you see hundreds of old weapons and dozens of armour sets. They don't reflect as much light as one would expect, probably because of all the dust they've collected. Sadly, all the armour sets are too small for you and the weapons too heavy. Definitely the work of Dwarves.",
			actions: [
				{Forward, "Move to the next room, whatever it takes!"},
				{Heal, "Heal before engaging the creature!"}],
			trigger: :enemy
		},
		%Room{
			description: "You open the door to this room and you're instantly hit with the smell of rotting food. As you step in, you realize you're in an abandoned kitchen. There's a fireplace to your left, a counter to your right and a lot of cabinets on the other end. Those cabinets are probably filled with the rotting food. The smell is so pungent you decide searching for something edible would be a hopeless endeavour.",
			actions: [
				{Forward, "Move to the next room, whatever it takes!"},
				{Heal, "Heal before engaging the creature!"}],
			trigger: :enemy
		},
		%Room{
			description: "You step into what looks like a hallway. There are large statues of dwarves in both sides of the room and long extinguished candeliers on the ceiling. Is this the entrance to the dungeon?",
			actions: [
				{Forward, "Move to the next room, whatever it takes!"},
				{Heal, "Heal before engaging the creature!"}],
			trigger: :exit
		}]
	end
end
