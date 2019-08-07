defmodule Dpw.Problems.Problem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "problems" do
    field :description, :string
    field :featured, :integer, default: nil
    field :needs, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(problem, attrs) do
    problem
    |> cast(attrs, [:title, :description, :needs, :featured])
    |> validate_required([:title, :description, :needs])
  end
end
