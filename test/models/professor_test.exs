defmodule EnrollmentApp.ProfessorTest do
  use EnrollmentApp.ModelCase

  alias EnrollmentApp.Professor

  @valid_attrs %{name: "some content", department_id: 1}
  @attrs_without_department_id %{name: "some content"}
  @invalid_attrs %{name: "length Widodo signed a government regulation to amend the current law on July 10 after considering that the law is “inadequate” to deal with groups bent on undermining the state ideology and the Constitution
  According to the law, “during an urgent situation” the president has the right to issue a government regulation in lieu of the law."}

  test "changeset with valid attributes" do
    changeset = Professor.changeset(%Professor{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with no department id" do
      changeset = Professor.changeset(%Professor{}, @attrs_without_department_id)
      refute changeset.valid?
    end

  test "changeset with invalid attributes" do
    changeset = Professor.changeset(%Professor{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with valid name length" do
    changeset = Professor.changeset(%Professor{}, @invalid_attrs)
    refute changeset.valid?
  end

end
