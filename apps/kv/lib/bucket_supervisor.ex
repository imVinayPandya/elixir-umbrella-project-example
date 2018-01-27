defmodule KV.BucketSupervisor do
  use DynamicSupervisor

  # A simple module attribute that stores the supervisor name
  @name KV.BucketSupervisor

  def start_link(_opts) do
    DynamicSupervisor.start_link(__MODULE__, :ok, name: @name)
  end

  def start_bucket do
    DynamicSupervisor.start_child(@name, KV.Bucket)
  end

  def init(:ok) do
    # We just init the supervisor without specifying the children
    DynamicSupervisor.init(strategy: :one_for_one)
  end
end