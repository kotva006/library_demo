defmodule LibraryDemoWeb.Notes.NotesList do
  use LibraryDemoWeb, :live_view

  alias LibraryDemo.Notes.Note

  @impl true
  def mount(_params, _session, socket) do
    notes = LibraryDemo.Notes.NotesList.list()
    {:ok, assign(socket, notes: notes, note_form: to_form(%{}))}
  end

  @impl true
  def handle_event("save", params, socket) do
    LibraryDemo.Notes.NotesList.create(params)
    notes = LibraryDemo.Notes.NotesList.list()
    {:noreply, assign(socket, notes: notes, note_form: to_form(%{}))}
  end

  @impl true
  def handle_event("inc_temperature", _params, socket) do
    {:noreply, update(socket, :temperature, &(&1 + 1))}
  end
end
