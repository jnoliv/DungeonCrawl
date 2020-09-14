defmodule Action.Forward do
	@behaviour Action

	alias DungeonCrawl
	alias CLI

	@impl Action
	def run(hero, enemy) do		
		# Battle
		hero = DungeonCrawl.battle(hero, enemy, true)

		# Show HP
		CLI.show_hp(hero)

		hero
	end
end
