defmodule Counter.Server do
  def start() do
    spawn( fn() -> loop(0) end )
  end
  
  def loop(value) do
    new_value = listen(value)
    loop(new_value)
  end
  
  def listen(state) do
    receive do
      {:tick, _from} ->
        Counter.Impl.tick(state)
      {:state, from} -> 
        send(from, state)
        state
    end
  end
end