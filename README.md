# JsonEx

Ignore if your maps have string keys or atom keys, just code.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `json_ex` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:json_ex, "~> 0.1.0"}]
    end
    ```

  2. Ensure `json_ex` is started before your application:

    ```elixir
    def application do
      [applications: [:json_ex]]
    end
    ```

## Usage

1. Get key value

```elixir
child_a = JsonEx.get(%{
  a: 1,
  child: %{
    a: 1,
    b: 2
  }
}, "child.a") # result: 1
```
    
2. Set key value
  
```elixir
new_map = JsonEx.set(%{
  a: 1,
  child: %{
    a: 1,
    b: 2
  }
}, "child.a", 3)

child_a = JsonEx.get(new_map, "child.a") # result: 3
```
  
3. Delete key
  
```elixir
a = JsonEx.delete(%{
  a: 1,
  child: %{
    a: 1,
    b: 2
  }
}, "child.a")

child_a = JsonEx.get(@map_with_string_keys, "child.a") # result: nil
```
  
4. Convert stringy map to atomic map
  
```elixir
new_map = JsonEx.to_atomic_map(%{
  "a": 1,
  "child": %{
    a: 1,
    b: 2
  }
})

a = new_map[:a] # result: 1
```
