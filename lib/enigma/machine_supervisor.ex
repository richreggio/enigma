defmodule Enigma.MachineSupervisor do
  use DynamicSupervisor

  def start_link(_init_args) do
    DynamicSupervisor.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(_init_args) do
    DynamicSupervisor.init(strategy: :one_for_one)
  end

  def start_child(options) do
    DynamicSupervisor.start_child(__MODULE__, {Enigma.Machine, options})
  end
end
