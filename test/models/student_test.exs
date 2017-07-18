defmodule EnrollmentApp.StudentTest do
  use EnrollmentApp.ModelCase

  alias EnrollmentApp.Student

  @valid_attrs %{address: "some content", email_id: "some content", mobile: 42, name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Student.changeset(%Student{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Student.changeset(%Student{}, @invalid_attrs)
    refute changeset.valid?
  end
end
