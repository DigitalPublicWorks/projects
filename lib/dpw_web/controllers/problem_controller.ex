defmodule DpwWeb.ProblemController do
  use DpwWeb, :controller

  alias Dpw.Problems

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _params) do
    render(conn, "new.html", changeset: nil)
  end

  def create(conn, %{"problem" => problem_params}) do
    case Problems.create_problem(problem_params) do
      {:ok, problem} -> 
        redirect(conn, to: "/problems/#{problem.id}")
      {:error, message, changeset}  ->
        conn
        |> put_flash(:error, message)
        |> render("new.html", changeset: changeset)
      _ -> 
        # TODO: Send an email to nick@digitalpublicworks.com with details
        conn
        |> put_flash(:error, "Something unexpected happened, please contact nick@digitalpublicworks.com")
        |> render(conn, "new.html", changeset: nil)
    end
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.html", problem: Problems.get_problem_by_id(id))
  end


end
