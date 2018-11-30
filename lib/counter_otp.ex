defmodule CounterOtp do
  def start do
    {:ok, pid} = GenServer.start_link(Counter.Service, 0)
    pid
  end
  
  def tick(pid) do
    GenServer.cast(pid, :tick)
  end
  
  def state(pid) do
    GenServer.call(pid, :state)
  end
end