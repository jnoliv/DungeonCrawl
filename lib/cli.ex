defmodule CLI do
	def choose_hero(heroes) do
		IO.puts "\nSelect a hero (write its number and press enter):\n"

		heroes
		|> Enum.with_index()
		|> Enum.map(fn {hero, index} ->
			IO.puts "#{index} - #{hero.name}"
			IO.puts "     #{hero.description}\n"
		end)

		choice_index = get_choice(0..length(heroes) - 1)
		choice = Enum.at(heroes, choice_index)

		IO.puts "You have chosen the #{choice.name}"
		confirmed = ExPrompt.confirm("Is this ok?")

		if confirmed do
			IO.puts "\nYou have most definitely chosen the #{choice.name}\n"
			choice
		else
			choose_hero(heroes)
		end
	end

	def choose_action(actions) do
		IO.puts "Select an action (write its number and press enter):\n"

		actions
		|> Enum.with_index()
		|> Enum.map(fn {action, index} ->
			{_action_fn, action_name} = action

			IO.puts "#{index} - #{action_name}"
		end)

		choice_index = get_choice(0..length(actions) - 1)
		Enum.at(actions, choice_index)
	end

	defp get_choice(options) do
		retry = fn (options) ->
			options_string = Enum.join(options, ",")
			IO.puts "Please choose from [#{options_string}]"
			get_choice(options)
		end

		validate = fn (parsed_answer) ->
			case parsed_answer do
				{int, ""} ->
					if int in options do
						int
					else
						retry.(options)
					end
				{_int, _rem} -> retry.(options)
				:error -> retry.(options)
			end
		end

		ExPrompt.string("")
		|> Integer.parse
		|> validate.()
	end

	def show_room(room) do
		IO.puts "#{room.description}\n"
	end

	def show_enemy(enemy) do
		IO.puts "A(n) #{enemy.name} appears!"
		IO.puts "(#{enemy.description})\n"
	end

	def show_attack(character1, character2, dmg) do
		IO.puts "#{character1.name} used #{character1.attack_description} on #{character2.name} for #{dmg} damage!"
	end

	def show_hp(hero) do 
		IO.puts "You currently have #{hero.hp}/#{hero.max_hp} HP\n"
	end

	def show_win(hero) do
		IO.puts ""
		IO.puts "As you move forward, you see a staircase lit from above"
		IO.puts "You realize the light source is daylight!"
		IO.puts ""
		IO.puts "Congratulations, you have won with the #{hero.name}!"
		IO.puts "You reached the end with #{hero.hp}/#{hero.max_hp} HP"
	end

	def show_loss(hero) do
		IO.puts ""
		IO.puts "The foe you were fighting proved to be too hard to defeat"
		IO.puts "You see the creature laugh as you fall to the ground, bleeding profusely"
		IO.puts ""
		IO.puts "Oh no, you have lost with the #{hero.name}!"
		IO.puts "Better luck next time!"
	end
end
