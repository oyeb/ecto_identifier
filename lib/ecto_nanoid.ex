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

  @doc """
  Delegates generation of the field to `Nanoid.generate/0`.
  """
  @spec autogenerate() :: String.t()
  def autogenerate, do: Nanoid.generate()
end
