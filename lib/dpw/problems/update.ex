defmodule Dpw.Problems.Update do
  use Ecto.Schema
  import Ecto.Changeset

  schema "updates" do
    field :attachments, {:array, :string}
    field :body, :string
    field :tags, {:array, :string}
    field :title, :string

    field :problem_id, :id

    timestamps()
  end

  @doc false
  def changeset(update, attrs) do
    update
    |> cast(attrs, [:title, :body, :tags, :attachments])
    |> validate_required([:title, :body, :tags, :attachments])
  end
end
