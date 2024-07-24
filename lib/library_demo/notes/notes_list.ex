defmodule LibraryDemo.Notes.NotesList do
  use GenServer

  # Server
  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @impl true
  def init(_) do
    {:ok, %{next_id: 1, notes: []}}
  end

  @impl true
  def handle_call(:list, _from, state) do
    {:reply, state.notes, state}
  end

  @impl true
  def handle_call({:create, %{"title" => title, "description" => description}}, _from, state) do
    note = %{title: title, description: description, id: state.next_id, date_modified: ""}
    {:reply, note, %{next_id: state.next_id + 1, notes: [note | state.notes]}}
  end

  # Client API
  def create(note) do
    GenServer.call(__MODULE__, {:create, note})
  end

  def list() do
    GenServer.call(__MODULE__, :list)
  end
end
