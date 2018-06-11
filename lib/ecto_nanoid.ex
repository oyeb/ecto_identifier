defmodule Ecto.Nanoid do
  @moduledoc """
  Custom type that can auto-generate nanoids.

  ## Usage
  ```
  defmodule Post do
    use Ecto.Schema
    alias Ecto.Nanoid

    schema "posts" do
      field(:number, Ecto.Nanoid, autogenerate: true)
      field(:data, :string)
    end
  end
  ```

  In your migrations for the `posts` table,
  ```
  create table(:posts) do
    add :number, :string
    add :data, :string
  end
  ```
  """

  @behaviour Ecto.Type

  def type, do: :string

  def cast(value) when is_binary(value), do: {:ok, value}
  def cast(_), do: :error

  def load(value), do: {:ok, value}

  def dump(value) when is_binary(value), do: {:ok, value}
  def dump(_), do: :error

  def autogenerate do
    case Application.get_env(:ecto_identifier, :nanoid) do
      %{size: size, alphabet: alphabet} ->
        Nanoid.generate(size, alphabet)

      %{alphabet: alphabet} ->
        Nanoid.generate(21, alphabet)

      %{size: size} ->
        Nanoid.generate(size)

      _ ->
        Nanoid.generate()
    end
  end
end
