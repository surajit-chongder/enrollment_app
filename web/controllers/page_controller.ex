defmodule EnrollmentApp.PageController do
  use EnrollmentApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
