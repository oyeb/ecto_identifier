defmodule Ecto.NanoidTest do
  use ExUnit.Case

  alias Ecto.{Changeset, Nanoid}
  alias EctoIdentifier.PostWithNanoid
  alias EctoIdentifier.TestRepo

  test "type/0" do
    assert :string == Nanoid.type()
  end

  test "cast" do
    assert {:ok, "pinkfloyd"} = Nanoid.cast("pinkfloyd")
    assert :error = Nanoid.cast(:pinkfloyd)
    assert :error = Nanoid.cast(123_456)
  end

  test "dump" do
    assert {:ok, "pinkfloyd"} = Nanoid.dump("pinkfloyd")
    assert :error = Nanoid.dump(:pinkfloyd)
    assert :error = Nanoid.dump(123_456)
  end

  test "load" do
    assert {:ok, "pinkfloyd"} = Nanoid.load("pinkfloyd")
  end

  describe "autogenerate" do
    test "struct doesn't come with an 'number' at creation" do
      post = %PostWithNanoid{}
      assert is_nil(post.id)
      assert is_nil(post.number)
    end

    test "'number' generated at insertion" do
      post = TestRepo.insert!(%PostWithNanoid{})
      refute is_nil(post.id)
      assert post.number =~ ~r/[~_A-Za-z0-9]{21}/
    end

    test "'number' not generated if provided in changeset/struct/map/keyword" do
      post = TestRepo.insert!(%PostWithNanoid{number: "pinkfloyd"})
      refute is_nil(post.id)
      assert post.number == "pinkfloyd"

      post =
        %PostWithNanoid{}
        |> Changeset.change(%{number: "pinkfloyd"})
        |> TestRepo.insert!()

      refute is_nil(post.id)
      assert post.number == "pinkfloyd"
    end
  end
end
