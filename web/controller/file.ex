defmodule Sakura2.Controller.File do
  use SolomonLib.Controller

  def create(conn) do
    client = Dodai.Client.new(:dev, app_id)
    body = %Dodai.CreateDedicatedFileEntityRequestBody{filename: filename, contentType: content_type, size: size}
    req  = Dodai.CreateDedicatedFileEntityRequest.new(group_id, file_collection_name, root_key, body)
    res = Dodai.Client.send(client, req)
    Dodai.CreateDedicatedFileEntitySuccess{res_body} = res
    IO.inspect(res_body)
    json(conn, 201, %{})
  end
end