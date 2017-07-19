defmodule EnrollmentApp.Student do
  use EnrollmentApp.Web, :model

  schema "students" do
    field :name, :string
    field :address, :string
    field :email_id, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :address, :email_id])
    |> validate_required([:name, :address, :email_id])
  end
end
