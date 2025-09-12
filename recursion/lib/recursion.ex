defmodule Recursion do
  @moduledoc """
  Documentation for `Recursion`.
  """

  def countdown(0), do: IO.puts("Finished")

  def countdown(n) when is_number(n) do
    IO.puts(n)
    countdown(n - 1)
  end

  def total(0), do: 0
  def total(n) when is_number(n), do: n + total(n - 1)

  def fibonacci(0), do: 0
  def fibonacci(1), do: 1

  def fibonacci(n) when is_number(n) and n > 1 do
    fibonacci(n - 1) + fibonacci(n - 2)
  end
end
