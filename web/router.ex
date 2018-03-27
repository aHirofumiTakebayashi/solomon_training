defmodule Sakura2.Router do
  use SolomonLib.Router
  
  static_prefix "/static"
  
  get "/hello", Hello, :hello
  get "/index", Index, :index
  post "/v1/file", File, :create
end
