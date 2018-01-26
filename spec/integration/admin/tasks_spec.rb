require 'rails_helper'

RSpec.describe "admin tasks page", type: :request do
  it "displays tasks list" do
    task = FactoryBot.create(:task)
    visit "/admin/tasks"

    expect(page).to have_content(task.name)
  end

  it "edits task" do
    task = FactoryBot.create(:task)
    visit "/admin/tasks/#{task.id}/edit"

    within(".edit_task") do
      fill_in 'task_name', with: 'New Name'
    end
    click_button 'Update Task'

    expect(page).to have_content 'Task updated'
  end

  it "creates task" do
    visit "/admin/tasks/new"

    within("#new_task") do
      fill_in 'task_name', with: 'New Task'
      fill_in 'task_description', with: 'Description'
    end
    click_button 'Create Task'

    expect(page).to have_content 'Task created'
  end

  it "deletes task" do
    task = FactoryBot.create(:task)
    visit "/admin/tasks/#{task.id}"

    click_link 'Remove Task'

    expect(page).to have_content 'Task deleted'
  end
end
