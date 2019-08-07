defmodule Dpw.Problems.Vote do
  use Ecto.Schema
  import Ecto.Changeset

  schema "votes" do
    field :opinion, :boolean, default: false
    field :problem_id, :id

    timestamps()
  end

  @doc false
  def changeset(vote, attrs) do
    vote
    |> cast(attrs, [:opinion, :problem_id])
    |> validate_required([:opinion, :problem_id])
  end
end
