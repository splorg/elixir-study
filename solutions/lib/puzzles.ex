defmodule Solutions.Puzzles do
  @moduledoc """
  A collection of small puzzles to practice basic Elixir concepts.
  """

  @doc """
  You are running a small shop and have to give change to customers.
  This function takes the total amount of the purchase and the amount paid by the customer.
  It should return a tuple with the `:ok` atom and the amount of change, if the paid amount is enough.
  If the paid amount is less than the total, it should return a tuple with the `:error` atom and the amount missing.

  For example:
  iex> Solutions.Puzzles.calculate_change(10, 15)
  {:ok, 5}
  iex> Solutions.Puzzles.calculate_change(10, 10)
  {:ok, 0}
  iex> Solutions.Puzzles.calculate_change(10, 5)
  {:error, 5}
  """
  def calculate_change(total, paid) do
    if paid >= total do
      {:ok, paid - total}
    else
      {:error, total - paid}
    end
  end

  @doc """
  You are building a simple access control system.
  This function takes a user's role (as an atom) and should return a welcome message.
  - If the role is `:admin`, it should return "Welcome, admin!".
  - If the role is `:user`, it should return "Welcome, user!".
  - For any other role, it should return "Access denied.".

  Hint: You can use case expressions or function pattern matching for this.

  For example:
  iex> Solutions.Puzzles.greet_user(:admin)
  "Welcome, admin!"
  iex> Solutions.Puzzles.greet_user(:user)
  "Welcome, user!"
  iex> Solutions.Puzzles.greet_user(:guest)
  "Access denied."
  """
  def greet_user(role) do
    case role do
      :admin -> "Welcome, admin!"
      :user -> "Welcome, user!"
      _ -> "Access denied."
    end
  end

  @doc """
  This function simulates a basic "FizzBuzz" game.
  It takes an integer and should return:
  - "FizzBuzz" if the number is divisible by both 3 and 5.
  - "Fizz" if the number is divisible by 3.
  - "Buzz" if the number is divisible by 5.
  - The number itself as a string if it's not divisible by 3 or 5.

  Hint: The `rem/2` function will be useful here. You'll need to check a few conditions.

  For example:
  iex> Solutions.Puzzles.fizzbuzz(15)
  "FizzBuzz"
  iex> Solutions.Puzzles.fizzbuzz(3)
  "Fizz"
  iex> Solutions.Puzzles.fizzbuzz(5)
  "Buzz"
  iex> Solutions.Puzzles.fizzbuzz(4)
  "4"
  """
  def fizzbuzz(number) do
    case {rem(number, 3), rem(number, 5)} do
      {0, 0} -> "FizzBuzz"
      {0, _} -> "Fizz"
      {_, 0} -> "Buzz"
      _ -> Integer.to_string(number)
    end
  end

  @doc """
  This function checks if a given year is a leap year.
  A leap year is divisible by 4, except for years divisible by 100 but not by 400.
  It should return `true` if it's a leap year, and `false` otherwise.

  For example:
  iex> Solutions.Puzzles.is_leap_year(2024)
  true
  iex> Solutions.Puzzles.is_leap_year(2023)
  false
  iex> Solutions.Puzzles.is_leap_year(1900)
  false
  iex> Solutions.Puzzles.is_leap_year(2000)
  true
  """
  def is_leap_year(year) do
    (rem(year, 4) == 0 and rem(year, 100) != 0) or rem(year, 400) == 0
  end

  # --- Collection Puzzles ---

  @doc """
  This function takes a list of numbers and should return the sum of all numbers.
  Hint: The `Enum.sum/1` function can be used here.
  For example:
  iex> Solutions.Puzzles.sum_list([1, 2, 3, 4, 5])
  15
  """
  def sum_list(list) do
    Enum.sum(list)
  end

  @doc """
  This function takes a list of words and should return a map where the keys are the words
  and the values are the lengths of the words.
  Hint: You can use `Enum.into/2` with a transform function.
  For example:
  iex> Solutions.Puzzles.word_lengths(["hello", "world"])
  %{"hello" => 5, "world" => 5}
  """
  def word_lengths(words) do
    Enum.into(words, %{}, fn word -> {word, String.length(word)} end)
  end

  @doc """
  This function takes a list of 2-element tuples, where each tuple contains a product name and its price.
  It should return the name of the product with the highest price.
  Hint: `Enum.max_by/2` is a great function for this.
  For example:
  iex> Solutions.Puzzles.highest_priced_product([{"apple", 1}, {"banana", 2}, {"orange", 1.5}])
  "banana"
  """
  def highest_priced_product(products) do
    Enum.max_by(products, fn {_, price} -> price end) |> elem(0)
  end
end
