defmodule ModuleNamespace.ReportMacros do
  # macros are special functions that generate code at compile time
  # meta-programming
  defmacro log_report_generation(type) do
    quote do
      IO.puts("Generating #{unquote(type)} report")
    end
  end
end
