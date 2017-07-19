defmodule EnrollmentApp.DepartmentTest do
  use EnrollmentApp.ModelCase

  alias EnrollmentApp.Department

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}
  @invalid_attrs_length %{name: "length Widodo signed a government regulation to amend the current law on July 10 after considering that the law is “inadequate” to deal with groups bent on undermining the state ideology and the Constitution.
  According to the law, “during an urgent situation” the president has the right to issue a government regulation in lieu of the law."}

  test "changeset with valid attributes" do
    changeset = Department.changeset(%Department{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Department.changeset(%Department{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with name zero length" do
        changeset = Department.changeset(%Department{}, @invalid_attrs)
        refute changeset.valid?
      end

  test "changeset with invalid name with larger length" do
          changeset = Department.changeset(%Department{}, @invalid_attrs_length)
          refute changeset.valid?
        end
end
