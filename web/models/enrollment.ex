defmodule EnrollmentApp.Enrollment do
  use EnrollmentApp.Web, :model


  schema "enrollments" do
    belongs_to :student, EnrollmentApp.Student
    belongs_to :course, EnrollmentApp.Course

    timestamps()


  end

  @required_fields ~w(student_id course_id)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields ++ @optional_fields)
    |> validate_required([:student_id, :course_id])
  end
end
