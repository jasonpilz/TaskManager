require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  def test_task_is_created
    TaskManager.create({  :title => "My title",
                          :description => "get stuff done" })
    task = TaskManager.find(1)
    assert_equal 1, task.id
    assert_equal "My title", task.title
    assert_equal "get stuff done", task.description
  end

  def test_task_is_updated
    TaskManager.create({  :title => "My title",
                          :description => "get stuff done" })
    task = TaskManager.find(1)
    assert_equal 1, task.id
    assert_equal "My title", task.title
    assert_equal "get stuff done", task.description
    data = {  :title => "My title changed",
              :description => "get more stuff done" }
    TaskManager.update(1, data)
    changed_task = TaskManager.find(1)
    assert_equal 1, task.id
    assert_equal "My title changed", changed_task.title
    assert_equal "get more stuff done", changed_task.description
  end

  def test_task_is_deleted
    TaskManager.create({  :title => "My title",
                          :description => "get stuff done" })
    task = TaskManager.find(1)
    assert_equal 1, task.id
    assert_equal "My title", task.title
    assert_equal "get stuff done", task.description
    TaskManager.delete(1)
    tasks = TaskManager.all
    assert_equal [], tasks
  end

  def test_find_returns_specific_task
    TaskManager.create({  :title => "First title",
                          :description => "first description" })
    TaskManager.create({  :title => "Second title",
                          :description => "second description" })
    task_1 = TaskManager.find(1)
    task_2 = TaskManager.find(2)
    assert_equal "First title", task_1.title
    assert_equal "Second title", task_2.title
    assert_equal "first description", task_1.description
    assert_equal "second description", task_2.description
  end

  def test_all_returns_all_tasks
    TaskManager.create({  :title => "First title",
                          :description => "first description" })
    TaskManager.create({  :title => "Second title",
                          :description => "second description" })
    tasks = TaskManager.all
    assert_equal 1, tasks[0].id
    assert_equal 2, tasks[1].id
    assert_equal 2, tasks.count
  end
end
