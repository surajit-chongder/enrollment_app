defmodule EnrollmentApp.Repo.Migrations.CreateProfessor do
  use Ecto.Migration

  def change do
    create table(:professors) do
      add :name, :string, null: false
      add :department_id, references(:departments, on_delete: :nothing)

      timestamps()
    end
    create index(:professors, [:department_id])
  end
end
