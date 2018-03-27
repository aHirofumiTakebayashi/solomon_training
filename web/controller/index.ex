defmodule Sakura2.Controller.Index do
  use SolomonLib.Controller

  def index(conn) do
    Sakura2.Gettext.put_locale(conn.request.query_params["locale"] || "en")
    render(conn, 200, "index", [gear_name: :sakura2])
  end
end