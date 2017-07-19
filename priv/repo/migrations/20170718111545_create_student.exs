defmodule EnrollmentApp.Repo.Migrations.CreateStudent do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string, null: false
      add :address, :string, null: false
      add :email_id, :string, null: false

      timestamps()
    end

  end
end
