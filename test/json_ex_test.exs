defmodule JsonExTest do
  use ExUnit.Case
  doctest JsonEx

  alias JsonEx

  @map_with_string_keys %{
    "a": 1,
    "child": %{
      "a": 1,
      "b": 2
    }
  }

  @map_with_atom_keys %{
    a: 1,
    child: %{
      a: 1,
      b: 2
    }
  }

  test "find key on stringy map" do
    a = JsonEx.get(@map_with_string_keys, "a")
    child_a = JsonEx.get(@map_with_string_keys, "child.a")
    assert a == 1
    assert child_a == 1
  end

  test "find key on atomic map" do
    a = JsonEx.get(@map_with_atom_keys, "a")
    child_a = JsonEx.get(@map_with_atom_keys, "child.a")
    assert a == 1
    assert child_a == 1
  end

  test "update key on stringy map" do
    new_map = JsonEx.set(@map_with_string_keys, "child.a", 3)
    a = JsonEx.get(new_map, "child.a")
    assert a == 3
  end

  test "update key on atomic map" do
    new_map = JsonEx.set(@map_with_atom_keys, "child.a", 3)
    a = JsonEx.get(new_map, "child.a")
    assert a == 3
  end

  test "delete key on stringy map" do
    new_map = JsonEx.delete(@map_with_string_keys, "child.a")
    a = JsonEx.get(new_map, "child.a")
    assert a == nil
  end

  test "delete key on atomic map" do
    new_map = JsonEx.delete(@map_with_atom_keys, "child.a")
    a = JsonEx.get(new_map, "child.a")
    assert a == nil
  end

  test "stringy map to atomic map" do
    new_map = JsonEx.to_atomic_map(@map_with_string_keys)
    assert new_map[:a] == 1
  end

  test "atomic map to atomic map" do
    new_map = JsonEx.to_atomic_map(@map_with_atom_keys)
    assert new_map[:a] == 1
  end

  test "atomic map to string" do
    json_string = JsonEx.to_string(@map_with_atom_keys)
    assert json_string == "{\"child\":{\"b\":2,\"a\":1},\"a\":1}"
  end

  test "string map to string" do
    json_string = JsonEx.to_string(@map_with_atom_keys)
    assert json_string == "{\"child\":{\"b\":2,\"a\":1},\"a\":1}"
  end
end
