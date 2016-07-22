defmodule ParticipateApi.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use ParticipateApi.Web, :controller
      use ParticipateApi.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      use Ecto.Schema

      import Ecto
      import Ecto.Changeset
      import Ecto.Query, only: [from: 1, from: 2]
    end
  end

  def controller do
    quote do
      use Phoenix.Controller

      alias ParticipateApi.Repo
      import Ecto
      import Ecto.Query, only: [from: 1, from: 2]

      import ParticipateApi.Router.Helpers
      import ParticipateApi.Gettext
    end
  end

  def view do
    quote do
      import ParticipateApi.Router.Helpers
      use JaSerializer.PhoenixView
    end
  end

  def router do
    quote do
      use Phoenix.Router
    end
  end

  def channel do
    quote do
      use Phoenix.Channel

      alias ParticipateApi.Repo
      import Ecto
      import Ecto.Query, only: [from: 1, from: 2]
      import ParticipateApi.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
