require 'faker'
User.create(first_name: "Tuli", last_name: "Jakobson", email: "turbotuli@gmail.com")
5.times do
  first = Faker::Name.first_name
  last = Faker::Name.last_name
  email = "#{first}_#{last}@launchacademy.com"
  User.create(first_name: first, last_name: last, email: email)
end

Project.create(name: "Project Planner Online", description: "Phase 10 system check")
Project.create(name: "Meetups in Space Javascript")
Project.create(name: "Capstone Project")

Contributor.create(user_id: 1, project_id: 1)
Contributor.create(user_id: 2, project_id: 1)
Contributor.create(user_id: 3, project_id: 1)
Contributor.create(user_id: 4, project_id: 1)
Contributor.create(user_id: 1, project_id: 2)
Contributor.create(user_id: 2, project_id: 2)
Contributor.create(user_id: 5, project_id: 2)
Contributor.create(user_id: 1, project_id: 3)
Contributor.create(user_id: 6, project_id: 3)
