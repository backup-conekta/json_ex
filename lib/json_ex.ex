defmodule JsonEx do
  alias AtomicMap
  alias Poison

  def get(data, path) do
    data = to_atomic_map(data)
    get_in data, path_to_atoms(path)
  end

  def set(data, path, value) do
    data = to_atomic_map(data)

    case !is_nil(value) do
      true -> update_in data, path_to_atoms(path), fn(_v) -> value end
    end
  end

  def delete(data, path) do
    data = to_atomic_map(data)

    {_, data} = pop_in data, path_to_atoms(path)
    
    data
  end

  def to_string(data) do
    Poison.encode!(data)
  end

  def to_atomic_map(data) do
    AtomicMap.convert(data, safe: false)
  end

  defp path_to_atoms(path) do
    Enum.map(String.split(path, "."), fn(x) -> String.to_atom x end)
  end
end
