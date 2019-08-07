defmodule DpwWeb.Router do
  use DpwWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DpwWeb do
    pipe_through :browser

    get "/", PageController, :index
    
    # Problems
    get "/problems", ProblemController, :index
    get "/problems/:id", ProblemController, :show

    # Votes
    post "/problems/:id/votes", VoteController, :create
    put "/problems/:problem_id/votes/:id", VoteController, :update

    # Updates
    post "/problems/:id/updates", UpdateController, :create
    get "/problems/:problem_id/updates/:id/edit", UpdateController, :edit
    put "/problems/:problem_id/updates/:id", UpdateController, :update
    delete "/problems/:problem_id/updates/:id", UpdateController, :delete
    get "/problems/:problem_id/updates/:id/delete", UpdateController, :delete

  end

  scope "/admin", DpwWeb do
    pipe_through :browser

    get "/problems/new", ProblemController, :new
    post "/problems", ProblemController, :create

  end

  # Other scopes may use custom stacks.
  # scope "/api", DpwWeb do
  #   pipe_through :api
  # end
end
