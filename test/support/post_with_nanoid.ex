defmodule EctoIdentifier.PostWithNanoid do
  @moduledoc false
  use Ecto.Schema

  alias Ecto.Nanoid

  schema("posts_nanoid") do
    field(:number, Nanoid, autogenerate: true)
  end
end
