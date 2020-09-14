defmodule DungeonCrawl do
	alias Assets
	alias CLI

	def main(_args \\ []) do
		# Display welcome message
		IO.puts Assets.welcome_message

		# Query user for hero selection
		hero = CLI.choose_hero(Assets.heroes)

		# Game Loop
		{success, hero} = game_loop(hero)

		# End
		if success do
			CLI.show_win(hero)
		else
			CLI.show_loss(hero)
		end
	end

	defp game_loop(hero) do
		# Choose random room
		room = Enum.random(Assets.rooms)
		CLI.show_room(room)

		# Select random enemy
		enemy = Enum.random(Assets.enemies)
		CLI.show_enemy(enemy)

		# Select action
		{action, _action_name} = CLI.choose_action(room.actions)
		hero = action.run(hero, enemy)

		# Check for end game conditions
		if hero.hp <= 0 do
			{false, hero}
		else
			if room.trigger == :exit do
				{true, hero}
			else
				game_loop(hero)
			end
		end
	end

	def battle(hero, enemy, true) do
		dmg = Enum.random(hero.attack_range)
		CLI.show_attack(hero, enemy, dmg)

		new_hp = do_dmg(dmg, enemy.hp)

		if new_hp == 0 do
			hero
		else
			enemy = Map.put(enemy, :hp, new_hp)
			battle(hero, enemy, false)
		end
	end

	def battle(hero, enemy, false) do
		dmg = Enum.random(enemy.attack_range)
		CLI.show_attack(enemy, hero, dmg)

		new_hp = do_dmg(dmg, hero.hp)
		hero = Map.put(hero, :hp, new_hp)

		if new_hp == 0 do
			hero
		else
			battle(hero, enemy, true)
		end
	end

	defp do_dmg(dmg, hp) do
		hp = hp - dmg
		if hp < 0, do: 0, else: hp
	end
end
