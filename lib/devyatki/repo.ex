defmodule Devyatki.Repo do
  use Ecto.Repo,
    otp_app: :devyatki,
    adapter: Ecto.Adapters.Postgres
end
