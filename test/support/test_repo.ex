defmodule EctoIdentifier.TestRepo do
  @moduledoc false
  use Ecto.Repo, otp_app: :ecto_identifier, adapter: Ecto.Adapters.Postgres
end
