defmodule EnrollmentApp.Professor do
  use EnrollmentApp.Web, :model

  schema "professors" do
    field :name, :string
    belongs_to :department, EnrollmentApp.Department

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
