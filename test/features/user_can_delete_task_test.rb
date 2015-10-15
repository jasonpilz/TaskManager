require_relative "../test_helper"

class DeleteTaskTest < FeatureTest
  def test_user_can_delete_task
    TaskManager.create(title: "New Task Yo", description: "New desc yo")
    TaskManager.create(title: "Second Task Yo", description: "Second desc yo")
    visit "/tasks"
    within "#row_2" do
      click_button("delete")
    end
    assert "/tasks", current_path
    assert page.has_content?("New Task Yo")
  end
end
