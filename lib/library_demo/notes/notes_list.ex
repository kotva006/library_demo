defmodule LibraryDemo.Notes.NotesList do
  use GenServer

  # Server
  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @impl true
  def init(_) do
    {:ok, %{next_id: 1, notes: %{}}}
  end

  @impl true
  def handle_call(:list, _from, state) do
    notes_list = Enum.map(Map.to_list(state.notes), fn {_key, note} -> note end)
    {:reply, notes_list, state}
  end

  @impl true
  def handle_call({:create, %{title: title, description: description}}, _from, state) do
    note = %{title: title, description: description, id: state.next_id, date_modified: ""}
    {:reply, note, %{next_id: state.next_id + 1, notes: Map.put(state.notes, state.next_id, note)}}
  end

  @impl true
  def handle_call({:update, %{id: id} = note}, _from, state) do
    new_notes = Map.put(state.notes, id, note)
    {:reply, note, %{state | notes: new_notes}}
  end

  def handle_call({:get, note_id}, _from, state) do
    found_note = Map.get(state.notes, note_id)
    {:reply, found_note, state}
  end

  # Client API
  def create(note) do
    GenServer.call(__MODULE__, {:create, note})
  end

  def update(note) do
    GenServer.call(__MODULE__, {:update, note})
  end

  def list() do
    GenServer.call(__MODULE__, :list)
  end

  def get(note_id) do
    GenServer.call(__MODULE__, {:get, note_id})
  end
end
