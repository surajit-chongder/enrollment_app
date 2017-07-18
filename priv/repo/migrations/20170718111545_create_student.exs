defmodule EnrollmentApp.Repo.Migrations.CreateStudent do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string
      add :address, :string
      add :email_id, :string
      add :mobile, :integer

      timestamps()
    end

  end
end