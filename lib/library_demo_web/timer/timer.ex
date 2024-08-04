defmodule LibraryDemoWeb.Timer.Timer do
  use LibraryDemoWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, timer: 0, timer_ref: nil)}
  end

  @impl true
  def handle_event("start", _, socket) do
    timer_ref = :erlang.start_timer(1000, self(), :tick)
    {:noreply, assign(socket, timer_ref: timer_ref)}
  end

  @impl true
  def handle_event("stop", _, %{assigns: %{timer_ref: nil}} = socket), do: {:noreply, socket}
  def handle_event("stop", _, socket) do
    _ = :erlang.cancel_timer(socket.assigns.timer_ref)
    {:noreply, assign(socket, timer: 0, timer_ref: nil)}
  end

  @impl true
  def handle_info({:timeout, _ref, :tick}, socket) do
    timer_ref = :erlang.start_timer(1000, self(), :tick)
    {:noreply, assign(socket, timer: socket.assigns.timer + 1, timer_ref: timer_ref)}
  end
end
