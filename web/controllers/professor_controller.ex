defmodule EnrollmentApp.ProfessorController do
  use EnrollmentApp.Web, :controller

  alias EnrollmentApp.Department

  alias EnrollmentApp.Professor

  def index(conn, _params) do
    professors = Repo.all(Professor)
    render(conn, "index.html", professors: professors)
  end

  def new(conn, _params) do
    departments = Repo.all(EnrollmentApp.Department)
#    departments = EnrollmentApp.Department |> Repo.all
    changeset = Professor.changeset(%Professor{})
    render(conn, "new.html", changeset: changeset, departments: departments )
  end

  def create(conn, %{"professor" => professor_params}) do
    changeset = Professor.changeset(%Professor{}, professor_params)

    case Repo.insert(changeset) do
      {:ok, _professor} ->
        conn
        |> put_flash(:info, "Professor created successfully.")
        |> redirect(to: professor_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    professor = Repo.get!(Professor, id)
    render(conn, "show.html", professor: professor)
  end

  def edit(conn, %{"id" => id}) do
    professor = Repo.get!(Professor, id)
    changeset = Professor.changeset(professor)
    render(conn, "edit.html", professor: professor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "professor" => professor_params}) do
    professor = Repo.get!(Professor, id)
    changeset = Professor.changeset(professor, professor_params)

    case Repo.update(changeset) do
      {:ok, professor} ->
        conn
        |> put_flash(:info, "Professor updated successfully.")
        |> redirect(to: professor_path(conn, :show, professor))
      {:error, changeset} ->
        render(conn, "edit.html", professor: professor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    professor = Repo.get!(Professor, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(professor)

    conn
    |> put_flash(:info, "Professor deleted successfully.")
    |> redirect(to: professor_path(conn, :index))
  end
end
