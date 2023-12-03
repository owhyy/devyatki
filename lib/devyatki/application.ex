defmodule Devyatki.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      DevyatkiWeb.Telemetry,
      Devyatki.Repo,
      {DNSCluster, query: Application.get_env(:devyatki, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Devyatki.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Devyatki.Finch},
      # Start a worker by calling: Devyatki.Worker.start_link(arg)
      # {Devyatki.Worker, arg},
      # Start to serve requests, typically the last entry
      DevyatkiWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Devyatki.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DevyatkiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
