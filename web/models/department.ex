defmodule EnrollmentApp.Department do
  use EnrollmentApp.Web, :model

  alias EnrollmentApp.Professor
  alias EnrollmentApp.Course

  schema "departments" do
    field :name, :string

    timestamps()

    has_many :professors, Professor
    has_many :courses, Course
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
