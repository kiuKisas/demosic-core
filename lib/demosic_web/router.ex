defmodule DemosicWeb.Router do
  use DemosicWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end
  
  pipeline :auth do
    plug Demosic.Auth.Pipeline
  end

  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated 
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Score maybe auth
  scope "/", DemosicWeb do
    pipe_through [:browser, :auth] # Use the default browser stack

    get "/", HelloController, :index
    #resources "/users", UserController
    # Session
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :delete
  end

  # Scope auth
  scope "/", DemosicWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    get "/secret", HelloController, :secret
  end 

  # Other scopes may use custom stacks.
  # scope "/api", DemosicWeb do
  #   pipe_through :api
  # end
end
