defmodule EnrollmentApp.Student do
  use EnrollmentApp.Web, :model

  schema "students" do
    field :name, :string
    field :address, :string
    field :email_id, :string

    timestamps()
  end

  @required_fields ~w(name address email_id)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required([:name, :address, :email_id])
    |> unique_constraint(:email)
    |> validate_format(:email_id,~r/@/)
  end
end
