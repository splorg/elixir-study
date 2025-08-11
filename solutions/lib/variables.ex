defmodule Solutions.Variables do
  @moduledoc """
  Practice exercises for Elixir's basic data types.
  """

  # --- Integer Exercises ---

  @doc """
  This function takes two integers and should return their sum.
  For example:
  iex> Solutions.Variables.add_two_numbers(2, 3)
  5
  """
  def add_two_numbers(a, b) do
    a + b
  end

  @doc """
  This function takes an integer and should return it multiplied by two.
  For example:
  iex> Solutions.Variables.multiply_by_two(5)
  10
  """
  def multiply_by_two(a) do
    a * 2
  end

  @doc """
  This function takes an integer and should return `true` if it's even, and `false` otherwise.
  Hint: You might want to use the `rem/2` function from the `Kernel` module.
  For example:
  iex> Solutions.Variables.is_even(4)
  true
  iex> Solutions.Variables.is_even(5)
  false
  """
  def is_even(number) do
    rem(number, 2) == 0
  end

  # --- Float Exercises ---

  @doc """
  This function takes two numbers and returns the result of their division as a float.
  Remember that in Elixir, the division operator `/` always returns a float.
  For example:
  iex> Solutions.Variables.divide_two_numbers(10, 2)
  5.0
  iex> Solutions.Variables.divide_two_numbers(10, 4)
  2.5
  """
  def divide_two_numbers(a, b) do
    a / b
  end

  @doc """
  This function takes a float and should return it converted to an integer.
  It should truncate the decimal part.
  Hint: Look for a function in the `Kernel` module that can truncate a number.
  For example:
  iex> Solutions.Variables.float_to_integer(5.8)
  5
  """
  def float_to_integer(float) do
    trunc(float)
  end

  # --- String Exercises ---

  @doc """
  This function takes two strings and should return them concatenated.
  Elixir uses the `<>` operator for string concatenation.
  For example:
  iex> Solutions.Variables.concatenate_strings("hello", " world")
  "hello world"
  """
  def concatenate_strings(a, b) do
    a <> b
  end

  @doc """
  This function takes a string and should return its length (number of bytes).
  Hint: The `String` module has a function for this.
  For example:
  iex> Solutions.Variables.string_length("elixir")
  6
  """
  def string_length(string) do
    String.length(string)
  end

  @doc """
  This function takes a string and should return it in uppercase.
  Hint: The `String` module has a function for this.
  For example:
  iex> Solutions.Variables.upcase_string("elixir")
  "ELIXIR"
  """
  def upcase_string(string) do
    String.upcase(string)
  end

  # --- Atom Exercises ---

  @doc """
  This function takes no arguments and should return the `:ok` atom.
  Atoms are constants representing a name. They are prefixed with a colon `:`.
  """
  def return_ok_atom() do
    :ok
  end

  @doc """
  This function takes an argument and should return `true` if it is the `:ok` atom, and `false` otherwise.
  You can use the `===` operator for strict equality checking.
  For example:
  iex> Solutions.Variables.is_atom_ok(:ok)
  true
  iex> Solutions.Variables.is_atom_ok(:error)
  false
  iex> Solutions.Variables.is_atom_ok("ok")
  false
  """
  def is_atom_ok(term) do
    term === :ok
  end

  @doc """
  This function takes an atom and should return its string representation.
  Hint: The `Atom` module provides functions for working with atoms.
  For example:
  iex> Solutions.Variables.atom_to_string(:elixir)
  "elixir"
  """
  def atom_to_string(atom) do
    Atom.to_string(atom)
  end
end
