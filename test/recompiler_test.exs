defmodule Recompiler.Test do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "that we can run the recompile task" do
    assert Mix.Tasks.Compile.Cldr.run(:x) in [:noop, :ok]
  end

  test "that we can recompile" do
    result = capture_io fn ->
      Mix.Tasks.Compile.Cldr.compile_cldr_files
    end
    assert result =~ "Generating Cldr for 6 locales named [\"de\", \"en\", \"pl\", \"root\", \"ru\", ...] with a default locale named \"en\"\n"
  end

  test "that we can recompile after locale change" do
    was = Application.get_env(:ex_cldr, :locales)
    Application.put_env(:ex_cldr, :locales, ["it", "en-GB"])

    result = capture_io fn ->
      Mix.Tasks.Compile.Cldr.compile_cldr_files
    end
    assert result =~ "Generating Cldr for 5 locales named [\"de\", \"en\", \"en-GB\", \"it\", \"root\"] with a default locale named \"en\"\n"

    Application.put_env(:ex_cldr, :locales, was)
  end
end