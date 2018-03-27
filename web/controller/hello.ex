defmodule Sakura2.Controller.Hello do
  use SolomonLib.Controller

  def hello(conn) do
    Sakura2.Gettext.put_locale(conn.request.query_params["locale"] || "en")
    render(conn, 200, "hello", [gear_name: :sakura2])
  end
end
