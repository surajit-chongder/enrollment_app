defmodule EnrollmentApp.CourseTest do
  use EnrollmentApp.ModelCase

  alias EnrollmentApp.Course

  @valid_attrs %{name: "Science"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Course.changeset(%Course{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Course.changeset(%Course{}, @invalid_attrs)
    refute changeset.valid?
  end
end
