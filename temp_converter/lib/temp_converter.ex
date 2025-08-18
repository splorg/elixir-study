defmodule TempConverter do
  @moduledoc """
  Documentation for `TempConverter`.
  """
  @doc """
  Convert temperature from one unit to another.

  ## Examples

  iex> TempConverter.convert_temp(30, :celsius, :fahrenheit)
  86.0
  """
  def convert_temp(temp, from_unit, to_unit) when is_number(temp) do
    case {from_unit, to_unit} do
      {:celsius, :fahrenheit} -> celsius_to_fahrenheit(temp)
      {:fahrenheit, :celsius} -> fahrenheit_to_celsius(temp)
      _ -> {:error, "Unsupported Unit Conversion"}
    end
  end

  defp celsius_to_fahrenheit(temp) do
    if temp < -273.15,
      do: {:error, "Temperature below absolute zero"},
      else: temp * 9 / 5 + 32
  end

  defp fahrenheit_to_celsius(temp) do
    case temp do
      _ when temp < -459.67 -> {:error, "Temperature below absolute zero"}
      _ -> (temp - 32) * 5 / 9
    end
  end
end
