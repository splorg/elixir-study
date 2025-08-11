# Hello world

## Notes

### File extensions

**.ex** files are regular Elixir source code files

- compiled into .beam bytecode

**.exs** files are Elixir scripts

- interpreted, not compiled
- used for quick tasks that don't require compilation, like running tests

### Project structure

- mix.exs
  - Elixir's "package.json"
  - Describes the Elixir project: name, elixir version, dependencies
- mix.lock
  - dependencies lockfile
- lib/
  - main source directory
- test/
  - unit tests using ExUnit
- _build/ (gitignored)
  - compilation artifacts
- deps/ (gitignored)
  - installed dependencies

### mix

mix is the Elixir build tool and script runner

- `mix new <project_name>` creates a project
  - optionally pass in `--module <main module name>` for a custom application/module name
- `mix hex.info <dep name>` looks up info for a Hex package
  - e.g releases
- `mix deps.get` downloads dependencies specified in mix.exs
- `mix compile` to build the project
- `mix test` to run tests in test/ directory

### Elixir shell

I can start an interactive shell by running `iex` anywhere. I can run an Elixir project in the interactive shell with `iex -S mix` in the project's directory.

### Tests - ExUnit

"doctests" run the examples inside the docs for functions on a module -> self-testing documentation or self-documenting tests?

ex:

```elixir
defmodule HelloWorld do
@doc """
  Hello world.

  ## Examples

      iex> HelloWorld.hello()
      :world

  """
  def hello do
    :world
  end
end
```

the doctest for this module will run "HelloWorld.hello()" and assert that the return value is `:world` when running tests for `hello/0`, because that is what's on `hello/0`'s doc.
