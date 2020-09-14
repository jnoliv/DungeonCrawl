defmodule Room do
	@enforce_keys [:description, :actions, :trigger]
	defstruct description: nil,
			  actions: [], # List of pairs, {fn, name}
			  trigger: nil

	@type t() :: %__MODULE__{
		description: String.t(),
		actions: [],
		trigger: atom()
	}
end
