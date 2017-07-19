defmodule EnrollmentApp.ProfessorControllerTest do
  use EnrollmentApp.ConnCase

  alias EnrollmentApp.Professor

  @valid_attrs %{name: "some content", department_id: 1}
  @invalid_attrs %{}
  @correct_department %{name: "TEst", id: 3}
  @departments [@correct_department, {"llll", 5}]
  test "lists all entries on index", %{conn: conn} do
    conn = get conn, professor_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing professors"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, professor_path(conn, :new)
    assert html_response(conn, 200) =~ "New professor"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    Repo.insert! %Department{id: 1, name: "TER"}
    conn = post conn, professor_path(conn, :create), professor: @valid_attrs
    assert redirected_to(conn) == professor_path(conn, :index)
    assert Repo.get_by(Professor, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, professor_path(conn, :create), professor: @invalid_attrs
    assert html_response(conn, 200) =~ "New professor"
  end

  test "shows chosen resource", %{conn: conn} do
    professor = Repo.insert! %Professor{name: "Ram Yadav"}
    conn = get conn, professor_path(conn, :show, professor)
    assert html_response(conn, 200) =~ "Show professor"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, professor_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    professor = Repo.insert! %Professor{name: "Ram Yadav"}
    conn = get conn, professor_path(conn, :edit, professor)
    assert html_response(conn, 200) =~ "Edit professor"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    professor = Repo.insert! %Professor{name: "Ram Yadav"}
    conn = put conn, professor_path(conn, :update, professor), professor: @valid_attrs
    assert redirected_to(conn) == professor_path(conn, :show, professor)
    assert Repo.get_by(Professor, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    professor = Repo.insert! %Professor{name: "Ram Yadav"}
    conn = put conn, professor_path(conn, :update, professor), professor: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit professor"
  end

  test "deletes chosen resource", %{conn: conn} do
    professor = Repo.insert! %Professor{name: "Ram Yadav"}
    conn = delete conn, professor_path(conn, :delete, professor)
    assert redirected_to(conn) == professor_path(conn, :index)
    refute Repo.get(Professor, professor.id)
  end
end
