defmodule EnrollmentApp.Repo.Migrations.CreateEnrollmentTable do
  use Ecto.Migration

  def change do
    create table(:enrollments) do
      add :student_id, references(:students, on_delete: :nothing)
      add :course_id, references(:courses, on_delete: :nothing)
      timestamps()
    end
    create index(:enrollments, [:student_id,:course_id])
  end
end
