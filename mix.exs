try do
  parent_dir = Path.absname(__DIR__) |> Path.dirname() |> Path.basename()
  mix_common_file_path =
    case parent_dir do
      "deps" -> Path.join([__DIR__, "..", "solomon", "mix_common.exs"])
      _      -> Path.join([__DIR__, "deps", "solomon", "mix_common.exs"])
    end
  Code.require_file(mix_common_file_path)

  defmodule Sakura2.Mixfile do
    use Solomon.GearProject

    defp gear_name(), do: :sakura2
    defp version()  , do: "0.0.1"
    defp gear_deps() do
      # Put names of gears which this gear depends on
      []
    end
  end
rescue
  Code.LoadError ->
    defmodule InitialSetup.Mixfile do
      use Mix.Project

      def project() do
        [
          app:  :just_to_fetch_solomon_repository,
          deps: [{:solomon, [git: "git@github.com:access-company/solomon.git"]}],
        ]
      end
    end
end
