defmodule EnrollmentApp.Repo.Migrations.CreateEnrollmentTable do
  use Ecto.Migration

  def change do
    create table(:enrollments) do
       add :brand_id, references(:brands, on_delete: :nothing)
       timestamps()
    end
       create index(:suppliers, [:brand_id])
  end
end
