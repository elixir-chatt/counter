defmodule Counter do
  def start do
    Counter.Server.start()
  end
  
  def tick(pid) do
    send(pid, {:tick, self()})
  end
  
  def state(pid) do
    send(pid, {:state, self()})
    receive do
      state -> state
    end
  end
end
