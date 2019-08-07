defmodule Dpw.Repo.Migrations.CreateProblems do
  use Ecto.Migration

  def change do
    create table(:problems) do
      add :title, :text
      add :description, :text
      add :needs, :text
      add :featured, :integer

      timestamps()
    end

  end
end
