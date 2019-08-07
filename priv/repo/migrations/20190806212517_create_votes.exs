defmodule Dpw.Repo.Migrations.CreateVotes do
  use Ecto.Migration

  def change do
    create table(:votes) do
      add :opinion, :boolean, default: false, null: false
      add :problem_id, references(:problems, on_delete: :nothing)

      timestamps()
    end

    create index(:votes, [:problem_id])
  end
end
