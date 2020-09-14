defmodule Character do
	@enforce_keys [:name, :description, :hp, :max_hp, :attack_range]
	defstruct name: nil,
			  description: nil,
			  attack_description: nil,
			  hp: 0,
			  max_hp: 0,
			  attack_range: nil
	
	@type t() :: %__MODULE__{
		name: String.t(),
		description: String.t(),
		attack_description: String.t(),
		hp: integer(),
		max_hp: integer(),
		attack_range: []
	}
end
