defmodule EnrollmentApp.Professor do
  use EnrollmentApp.Web, :model

  alias EnrollmentApp.Department

  schema "professors" do
    field :name, :string

    timestamps()

    belongs_to :department, Department
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
