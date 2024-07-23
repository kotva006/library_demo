defmodule LibraryDemoWeb.Live.Library do
  use LibraryDemoWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    temperature = 70 # Let's assume a fixed temperature for now
    {:ok, assign(socket, :temperature, temperature)}
  end

  @impl true
  def handle_event("inc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end
end
