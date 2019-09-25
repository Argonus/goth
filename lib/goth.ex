defmodule Goth do
  use Application

  @moduledoc """
  Google + Auth = Goth.
  """

  # for now, just spin up the supervisor
  def start(_type, _args) do
    if Application.get_env(:disable_on_start) do
      Supervisor.start_link([], strategy: :one_for_one)
    else
      start_link()
    end
  end

  defp start_link() do
    envs = Application.get_all_env(:goth)
    Goth.Supervisor.start_link(envs)
  end
end
