defmodule LibraryDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LibraryDemoWeb.Telemetry,
      LibraryDemo.Repo,
      LibraryDemo.Notes.NotesList,
      {DNSCluster, query: Application.get_env(:library_demo, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LibraryDemo.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LibraryDemo.Finch},
      # Start a worker by calling: LibraryDemo.Worker.start_link(arg)
      # {LibraryDemo.Worker, arg},
      # Start to serve requests, typically the last entry
      LibraryDemoWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LibraryDemo.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LibraryDemoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
