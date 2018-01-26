require 'rails_helper'

RSpec.describe "admin tasks page", type: :request do
  it "displays tasks list" do
    task = FactoryBot.create(:task)
    visit "/admin/tasks"

    expect(page).to have_content(task.name)
  end
end
