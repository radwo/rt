require 'rails_helper'

RSpec.describe "tasks page", type: :request do
  it "displays tasks list" do
    task = FactoryBot.create(:task)
    visit "/tasks"

    expect(page).to have_content(task.name)
  end

  it "displays task" do
    task = FactoryBot.create(:task_with_attempts)
    visit "/tasks/#{task.id}"

    expect(page).to have_content(task.attempts.sample.created_at)
  end

  it "creates attemtps on task" do
    task = FactoryBot.create(:task)
    visit "/tasks/#{task.id}/attempts/new"

    within("#new_attempt") do
      fill_in 'attempt_code', with: 'foo bar'
    end
    click_button 'Create Attempt'

    expect(page).to have_content('foo bar')
  end
end
