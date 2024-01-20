defmodule CliTest do
  use ExUnit.Case
  doctest Issues

  import Issues.Cli, only: [parse_args: 1]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three values returned if three given" do
    assert parse_args(["user", "best_project", "29"]) == {"user", "best_project", 29}
  end

  test "count is defaulted if two values are given" do
    assert parse_args(["user", "best_project"]) == {"user", "best_project", 4}
  end
end
