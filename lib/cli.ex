defmodule CLI do
	def choose_hero(heroes) do
		IO.puts("\nSelect a hero (write its number and press enter):\n")

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
			IO.puts "\nYou have most definitely chosen the #{choice.name}"
			choice
		else
			choose_hero(heroes)
		end
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
end
