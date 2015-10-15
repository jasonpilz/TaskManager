require_relative "../test_helper"

class UpdateTaskTest < FeatureTest
  def test_user_can_edit_a_task
    TaskManager.create(title: "New Task", description: "New Task Description")
    visit "/tasks"
    click_link "Edit"
    assert_equal "/tasks/1/edit", current_path

    fill_in("exampleInputTask", with: "new task title")
    fill_in("exampleInputDescription", with: "new task desc")
    click_button("Update Task")

    assert_equal "/tasks", current_path
    assert page.has_content?("All Tasks")
  end
end
