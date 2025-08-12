defmodule ModuleNamespace.ModuleName do
  @moduledoc """
  This is an example of a module inside a namespace.
  """

  @constant_value 123

  # function/0 -> arity 0 (no parameters)
  def function do
    "Returns last value in the function body."
  end

  def shorthand_definition, do: "Returns value."

  # more specific pattern matching must be defined before less specific ones
  # within the same arity
  def function(%{from: "brazil"} = example) do
    "Will match any map with from key set to \"brazil\". #{inspect(example)}"
  end

  def function(%{from: _, to: _} = example) do
    "Will match any map with from and to keys. #{inspect(example)}"
  end

  # function/1 -> arity 1 (one parameter)
  def function(:example_param) do
    Atom.to_string(:example_param)
  end

  # function/1 -> arity 1 (one parameter)
  # same function signature, but different param, will be pattern matched
  def function(:another_param) do
    "Returns another value."
  end

  # _ is a wildcard, will match any value
  # must be defined after all more specific definitions of the same arity
  def function(_) do
    "Returns wildcard value."
  end

  def function(_, _) do
    "Wildcard match for arity 2."
  end
end
