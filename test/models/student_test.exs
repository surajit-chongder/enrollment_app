defmodule EnrollmentApp.StudentTest do
  use EnrollmentApp.ModelCase

  alias EnrollmentApp.Student

  @valid_attrs %{address: "Velachery", email_id: "ram@gmail.com", name: "Ram Babu"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Student.changeset(%Student{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Student.changeset(%Student{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with invalid email" do
    changeset = Student.changeset(%Student{}, %{address: "Velachery", email_id: "ram.com", name: "Ram Babu"})
    refute changeset.valid?
  end

  test "changeset with valid email" do
    changeset = Student.changeset(%Student{}, %{address: "Velachery", email_id: "ram@gmail.com", name: "Ram Babu"})
    assert changeset.valid?
  end
end
