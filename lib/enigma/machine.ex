defmodule Enigma.Machine do
  use GenServer

  def start_link(init_args) do
    GenServer.start_link(__MODULE__, init_args)
  end

  def init(options) do
    {:ok, Enigma.State.setup_state(options)}
  end

  def handle_call({:restart}, _from, state) do
    {:reply, state}
  end

  def handle_call({:transcode, string}, _from, state) do
    {:reply, string, state}
  end
end
