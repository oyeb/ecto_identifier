defmodule Ecto.NanoidTest do
  use ExUnit.Case
  alias Ecto.Nanoid

  test "type/0" do
    assert :string == Nanoid.type()
  end
end
