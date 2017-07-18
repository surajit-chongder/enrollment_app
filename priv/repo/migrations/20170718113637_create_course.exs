defmodule EnrollmentApp.Repo.Migrations.CreateCourse do
  use Ecto.Migration

  def change do
    create table(:courses) do
      add :name, :string
      add :department_id, references(:departments, on_delete: :nothing)
      add :professor_id, references(:professors, on_delete: :nothing)

      timestamps()
    end
    create index(:courses, [:department_id])
    create index(:courses, [:professor_id])

  end
end
