defmodule Dpw.Problems do
  
  alias Dpw.Repo
  alias Dpw.Problems.{Problem, Update}

  import Ecto.Query

  def list_problems() do
    Repo.all(Problem)
  end

  def get_problem_by_id(id) do
    Repo.get_by(Problem, id: id)
  end

  def create_problem(attributes) do
    Problem.changeset(%Problem{}, attributes)
    |> Repo.insert()
  end

  def update_problem(problem, attributes) do
    Problem.changeset(problem, attributes) 
    |> Repo.update()
  end

  def delete_problem(problem) do
    from(update in Update, where: update.problem_id == ^problem.id)
    |> Repo.delete()
    Repo.delete(problem)
  end

  def list_updates_for_problem(problem) do
    from(update in Update, where: update.problem_id == ^problem.id)
    |> Repo.all()
  end

  def create_update_post(problem, attributes) do
    attributes = Map.put(attributes, :problem_id, problem.id)
    Update.changeset(%Update{}, attributes)
    |> Repo.insert()
  end

  def update_update_post(update, attributes) do
    Update.changeset(update, attributes)
    |> Repo.update()
  end

  def delete_update_post(update) do
    Repo.delete(update)
  end

end
