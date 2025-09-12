defmodule InventoryManager do
  def get_product(inventory_list, name) do
    # With Enum module
    # Enum.find(inventory_list, fn product -> product.name == name end)

    # Recursive approach
    find_product(inventory_list, name)
  end

  defp find_product([], _), do: nil
  defp find_product([%{name: name} = product | _tail], name), do: product

  defp find_product([_product | rest_inventory], name), do: find_product(rest_inventory, name)

  def update_inventory(inventory_list, product_name, amount) do
    # With Enum module
    # Enum.map(inventory_list, fn product ->
    #   if product.name == product_name do
    #     %{product | quantity: product.quantity - amount}
    #   else
    #     product
    #   end
    # end)

    # Recursive approach
    update_products(inventory_list, product_name, amount, [])
  end

  defp update_products([], _name, _amount, updated_inventory), do: Enum.reverse(updated_inventory)

  defp update_products([product | rest_inventory], name, amount, updated_inventory) do
    updated_product =
      if product.name == name do
        %{product | quantity: product.quantity - amount}
      else
        product
      end

    update_products(rest_inventory, name, amount, [updated_product | updated_inventory])
  end

  def restock(inventory) do
    # With Enum module
    # Enum.map(inventory, fn product ->
    #   if product.quantity < product.reorder_level do
    #     %{product | quantity: product.quantity + product.reorder_amount}
    #   else
    #     product
    #   end
    # end)

    # Recursive approach
    restock_products(inventory, [])
  end

  defp restock_products([], restocked_inventory), do: Enum.reverse(restocked_inventory)

  defp restock_products([product | rest_inventory], restocked_inventory) do
    updated_product =
      if product.quantity < product.reorder_level do
        %{product | quantity: product.quantity + product.reorder_amount}
      else
        product
      end

    restock_products(rest_inventory, [updated_product | restocked_inventory])
  end
end
