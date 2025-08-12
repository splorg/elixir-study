defmodule Solutions.Collections do
  @moduledoc """
  Practice exercises for Elixir's collection types: lists, tuples, and maps.
  """

  # --- List Exercises ---

  @doc """
  This function takes a list and should return its length.
  Hint: The `Kernel` module has a function for this.
  For example:
  iex> Solutions.Collections.list_length([1, 2, 3])
  3
  """
  def list_length(list) do
    length(list)
  end

  @doc """
  This function takes a list and an element, and should return a new list with the element added to the beginning.
  Hint: The `|` operator is used to prepend an element to a list.
  For example:
  iex> Solutions.Collections.prepend_to_list([1, 2, 3], 0)
  [0, 1, 2, 3]
  """
  def prepend_to_list(list, element) do
    [element | list]
  end

  @doc """
  This function takes a list of numbers and should return a new list with each number doubled.
  Hint: The `Enum.map/2` function is perfect for this.
  For example:
  iex> Solutions.Collections.double_each_number([1, 2, 3])
  [2, 4, 6]
  """
  def double_each_number(list) do
    Enum.map(list, fn x -> x * 2 end)
  end

  # --- Tuple Exercises ---

  @doc """
  This function takes a tuple and should return the element at the given index.
  Hint: The `elem/2` function is used to access tuple elements.
  For example:
  iex> Solutions.Collections.get_tuple_element({:ok, "hello", 123}, 1)
  "hello"
  """
  def get_tuple_element(tuple, index) do
    elem(tuple, index)
  end

  @doc """
  This function takes a tuple and an element, and should return a new tuple with the element at the given index updated.
  Hint: The `put_in/2` macro with `elem/2` can be used for this.
  For example:
  iex> Solutions.Collections.update_tuple_element({:ok, "world"}, 1, "hello")
  {:ok, "hello"}
  """
  def update_tuple_element(tuple, index, new_element) do
    put_elem(tuple, index, new_element)
  end

  # --- Map Exercises ---

  @doc """
  This function should create a map representing a user with a `name` and `age`.
  The function takes the name and age as arguments.
  For example:
  iex> Solutions.Collections.create_user_map("John", 30)
  %{name: "John", age: 30}
  """
  def create_user_map(name, age) do
    %{name: name, age: age}
  end

  @doc """
  This function takes a user map and should return the user's name.
  You can access map values using the `map.key` syntax or `Map.get/2`.
  For example:
  iex> Solutions.Collections.get_user_name(%{name: "Jane", age: 25})
  "Jane"
  """
  def get_user_name(user_map) do
    user_map.name
  end

  @doc """
  This function takes a user map and a new age, and should return a new map with the age updated.
  Hint: The `Map.put/3` function or the `%{map | key: new_value}` syntax can be used for this.
  For example:
  iex> Solutions.Collections.update_user_age(%{name: "Jane", age: 25}, 26)
  %{name: "Jane", age: 26}
  """
  def update_user_age(user_map, new_age) do
    Map.put(user_map, :age, new_age)
  end
end
