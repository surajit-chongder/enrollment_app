# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     EnrollmentApp.Repo.insert!(%EnrollmentApp.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias EnrollmentApp.Professor
alias EnrollmentApp.Student
alias EnrollmentApp.Course
alias EnrollmentApp.Department
alias EnrollmentApp.Repo

Repo.insert!(%Department{name: "Physics"})

Repo.insert!(%Professor{name: "Ram Yadav",department_id: Repo.get_by(Department, name: "Physics").id})

#Repo.insert!(%Student{name: "Saram Ram",address: "Chennai",email_id: "something@gmail.com"})

Repo.insert!(%Course{name: "Science", department_id: Repo.get_by(Department, name: "Physics").id, professor_id: Repo.get_by(Professor, name: "Ram Yadav").id})