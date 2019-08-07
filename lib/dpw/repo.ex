defmodule Dpw.Repo do
  use Ecto.Repo,
    otp_app: :dpw,
    adapter: Ecto.Adapters.Postgres
end
