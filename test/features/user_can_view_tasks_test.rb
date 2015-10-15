require_relative "../test_helper"

class ViewTasksTest < FeatureTest
  def test_user_can_view_all_tasks
    TaskManager.create(title: "New Task Yo", description: "New desc yo")
    TaskManager.create(title: "Second Task Yo", description: "Second desc yo")
    visit "/tasks"
    assert page.has_content?("New Task Yo")
    assert page.has_content?("Second Task Yo")
    assert page.has_css?("#task-table")
  end

  def test_user_can_view_single_task
    TaskManager.create(title: "New Task Yo", description: "New desc yo")
    visit "/tasks"
    click_link("New Task Yo")
    assert_equal "/tasks/1", current_path
    assert page.has_content?("New desc yo")
    assert page.has_content?("New Task Yo")
  end
end
