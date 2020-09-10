defmodule DungeonCrawl do
  alias Assets
  alias CLI

  def main(_args \\ []) do
    # Display welcome message
    IO.puts Assets.welcome_message

    # Query user for hero selection
    hero = CLI.choose_hero(Assets.heroes)

    # Game Loop
    # End
  end
end
