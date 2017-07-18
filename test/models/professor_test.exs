defmodule EnrollmentApp.ProfessorTest do
  use EnrollmentApp.ModelCase

  alias EnrollmentApp.Professor

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Professor.changeset(%Professor{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Professor.changeset(%Professor{}, @invalid_attrs)
    refute changeset.valid?
  end
end
