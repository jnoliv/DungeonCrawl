defmodule Action.Heal do
	@behaviour Action

	alias DungeonCrawl
	alias CLI

	@impl Action
	def run(hero, enemy) do
		# Heal before battle
		heal = Enum.random(div(hero.max_hp,  4) .. div(hero.max_hp, 3))
		hero = Map.put(hero, :hp, hero.hp + heal)
		CLI.show_heal(heal, hero)

		# Battle without initiative
		hero = DungeonCrawl.battle(hero, enemy, false)

		# Show HP
		CLI.show_hp(hero)

		hero
	end
end
