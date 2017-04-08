require "spec_helper"
feature "User can view projects and their details" do
  let!(:user_one) { User.create(first_name: "Tuli", last_name: "Jakobson", email: "turbotuli@gmail.com") }
  let!(:user_two) { User.create(first_name: "Nathan", last_name: "Bourke", email: "nathan_bourke@launchacademy.com" ) }
  let!(:user_three) { User.create(first_name: "Dan", last_name: "Pickett") }

  let!(:project_one) { Project.create(name: "Project Planner Online", description: "Phase 10 system check") }
  let!(:project_two) { Project.create(name: "Capstone Project") }

  let!(:contributor_one) { Contributor.create(user_id: 1, project_id: 1) }
  let!(:contributor_two) { Contributor.create(user_id: 2, project_id: 1) }
  let!(:contributor_three) { Contributor.create(user_id: 3, project_id: 1) }

  let!(:task) { Task.create(name: "Finish Exceeds Expectations", project_id: 1) }
  let!(:task_two) { Task.create(name: "Brainstorm ideas", project_id: 2, user_id: 1) }
  let!(:task_three) { Task.create(name: "Decide on project", project_id: 2) }


  scenario "user sees a list of projects" do
    visit '/projects'
    expect(page).to have_link("Project Planner Online")
    expect(page).to have_link("Capstone Project")
  end

  scenario "user clicks on a project to view its details" do
    visit '/projects'
    click_link('Project Planner Online')
    expect(page).to have_content('Project Planner Online')
    expect(page).to have_content('Phase 10 system check')
  end

  scenario "user can see the contributors to a project on its details page" do
    visit "/projects/#{project_one.id}"
    expect(page).to have_content("Tuli Jakobson (turbotuli@gmail.com)")
    expect(page).to have_content("Nathan Bourke (nathan_bourke@launchacademy.com)")
    expect(page).to have_content("Dan Pickett")
  end

  scenario "user can see all tasks for a project on its details page" do
    visit "/projects/#{project_one.id}"
    expect(page).to have_content("Finish Exceeds Expectations")
    visit "/projects/#{project_two.id}"
    expect(page).to have_content("Brainstorm ideas\nAssigned to: Tuli Jakobson")
    expect(page).to have_content("Decide on project")
  end



end
