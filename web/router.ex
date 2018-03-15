defmodule Sakura2.Router do
  use SolomonLib.Router

  get "/hello", Hello, :hello
end
