defmodule Sakura2.Controller.File do
  use SolomonLib.Controller

  def create(conn) do
    %{
      "DODAI_GROUP_ID" => group_id,
      "DODAI_ROOT_KEY" => root_key,
      "DODAI_APP_ID" => app_id
    } = Sakura2.get_all_env()
    client = Dodai.Client.new(:dev, app_id)
    filename = "hoge.jpg"
    content_type = "image/jpeg"
    size = 100
    file_collection_name = "sakura2_files"
    body = %Dodai.CreateDedicatedFileEntityRequestBody{filename: filename, contentType: content_type, size: size}
    req  = Dodai.CreateDedicatedFileEntityRequest.new(group_id, file_collection_name, root_key, body)
    res = Dodai.Client.send(client, req)
    Dodai.CreateDedicatedFileEntitySuccess{res_body} = res
    IO.inspect(res_body)
    json(conn, 201, %{})
  end
end