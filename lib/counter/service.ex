defmodule Counter.Service do
  use GenServer
  
  @impl true
  def init(initial_value) do
    {:ok, initial_value}
  end

  @impl true
  def handle_call(:state, _from, value) do
    {:reply, value, value}
  end

  @impl true
  def handle_cast(:tick, state) do
    {:noreply, Counter.Impl.tick(state)}
  end
end