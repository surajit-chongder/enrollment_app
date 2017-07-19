defmodule EnrollmentApp.Repo.Migrations.CreateDepartment do
  use Ecto.Migration

  def change do
    create table(:departments) do
      add :name, :string, null: false

      timestamps()
    end

  end
end
