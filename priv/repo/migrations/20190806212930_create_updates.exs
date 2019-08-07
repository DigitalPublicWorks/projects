defmodule Dpw.Repo.Migrations.CreateUpdates do
  use Ecto.Migration

  def change do
    create table(:updates) do
      add :title, :text
      add :body, :text
      add :tags, {:array, :text}
      add :attachments, {:array, :text}
      add :problem_id, references(:problems, on_delete: :nothing)

      timestamps()
    end

  end
end
