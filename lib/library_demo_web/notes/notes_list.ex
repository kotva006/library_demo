defmodule LibraryDemoWeb.Notes.NotesList do
  use LibraryDemoWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    notes = LibraryDemo.Notes.NotesList.list()
    {:ok, assign(socket, notes: notes, note_form: to_form(%{}))}
  end

  @impl true
  def handle_event("save", %{"note_id" => ""} = params, socket) do
    note = params_to_note(params)
    LibraryDemo.Notes.NotesList.create(note)
    notes = LibraryDemo.Notes.NotesList.list()
    {:noreply, assign(socket, notes: notes, note_form: to_form(%{}))}
  end

  def handle_event("save", params, socket) do
    note = params_to_note(params)
    LibraryDemo.Notes.NotesList.update(note)
    notes = LibraryDemo.Notes.NotesList.list()
    {:noreply, assign(socket, notes: notes, note_form: to_form(%{}))}
  end

  @impl true
  def handle_event("edit_note", %{"note_id" => note_id}, socket) do
    {note_id, _} = Integer.parse(note_id)
    note = LibraryDemo.Notes.NotesList.get(note_id)
    case note do
      nil -> {:noreply, socket}
      _ ->
        note = %{"note_id" => note.id, "title" => note.title, "description" => note.description}
        {:noreply, update(socket, :note_form, fn _ -> to_form(note) end)}
    end
  end

  @impl true
  def handle_event("delete", %{"note_id" => note_id}, socket) do
    {note_id, _} = Integer.parse(note_id)
    LibraryDemo.Notes.NotesList.delete(note_id)
    notes = socket.assigns.notes
    notes = Enum.reject(notes, fn note -> note.id == note_id end)
    {:noreply, assign(socket, :notes, notes)}
  end

  def params_to_note( %{"note_id" => "", "description" => description, "title" => title}) do
    %{title: title, description: description, date_modified: ""}
  end

  def params_to_note(%{"note_id" => note_id, "description" => description, "title" => title}) do
    {note_id, _} = Integer.parse(note_id)
    %{id: note_id, title: title, description: description, date_modified: ""}
  end
end
