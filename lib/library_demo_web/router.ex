defmodule LibraryDemoWeb.Router do
  use LibraryDemoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {LibraryDemoWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LibraryDemoWeb do
    pipe_through :browser

    get "/", LibraryController, :redirect_to_library
  end

  scope "/notes", LibraryDemoWeb do
    pipe_through :browser

    live "/", Notes.NotesList
  end

  scope "/timer", LibraryDemoWeb do
    pipe_through :browser

    live "/", Timer.Timer
  end

  scope "/library", LibraryDemoWeb do
    pipe_through :browser

    get "/", LibraryController, :index
    get "/search", LibraryController, :search
    resources "/books", BookController
    resources "/authors", AuthorController

    live "/my", Live.Library
  end

  # Other scopes may use custom stacks.
  # scope "/api", LibraryDemoWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:library_demo, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: LibraryDemoWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
