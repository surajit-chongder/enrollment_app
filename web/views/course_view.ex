defmodule EnrollmentApp.CourseView do
  use EnrollmentApp.Web, :view

  alias EnrollmentApp.Department
  alias EnrollmentApp.Professor
  alias EnrollmentApp.Repo

  def get_department_name(department_id) do
    Repo.get!(Department, department_id).name
  end

  def get_professor_name(professor_id) do
    Repo.get!(Professor, professor_id).name
  end

end
