defmodule EnrollmentApp.Course do
  use EnrollmentApp.Web, :model

  schema "courses" do
    field :name, :string
    belongs_to :department, EnrollmentApp.Department
    belongs_to :professor, EnrollmentApp.Professor

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
