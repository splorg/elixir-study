defmodule ShoppingCart do
  @moduledoc """
  Documentation for `ShoppingCart`.
  """

  def add_item(cart, product_name, amount, inventory) do
    case InventoryManager.get_product(inventory, product_name) do
      nil ->
        {:error, "Product not found"}

      %Product{} = product when product.quantity >= amount ->
        new_cart = [{product.name, amount} | cart]
        new_inventory = InventoryManager.update_inventory(inventory, product_name, amount)
        {:ok, new_cart, new_inventory}

      _ ->
        {:error, :insufficient_stock}
    end
  end

  def remove_item(cart, product_name, inventory) do
    case InventoryManager.get_product(inventory, product_name) do
      nil ->
        {:error, "Product not found"}

      product ->
        {_, item_quantity} = Enum.find(cart, fn {name, _} -> name == product.name end)
        new_cart = Enum.filter(cart, fn {name, _} -> name != product.name end)

        new_inventory =
          InventoryManager.update_inventory(inventory, product.name, -item_quantity)

        {:ok, new_cart, new_inventory}
    end
  end

  def remove_first([_ | tail]) do
    tail
  end

  def get_first(cart) do
    List.first(cart)
  end

  def get_last(cart) do
    List.last(cart)
  end

  def get_total(cart, inventory, discount \\ 0) do
    List.foldl(cart, 0, fn {name, amount}, total ->
      case InventoryManager.get_product(inventory, name) do
        nil ->
          {:error, "Product not found"}

        product ->
          total + product.price * amount
      end
    end)
    |> subtract_discount(discount)
  end

  defp subtract_discount(total, discount) do
    total * ((100 - discount) / 100)
  end
end
