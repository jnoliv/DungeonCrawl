defmodule Action do
	alias Character
	alias Room

	@callback run(Character.t(), Character.t()) :: Character.t()
end
