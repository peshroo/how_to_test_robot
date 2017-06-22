require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    @robot = Robot.new
    @robot.needs_repairs = true
    @robot.foreign_model = true
    @robot.vintage_model = false
    # act
    send_to_station = robot.station
    # assert
    assert_equal(send_to_station, 1)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    @robot = Robot.new
    @robot.needs_repairs = true
    @robot.foreign_model = false
    @robot.vintage_model = true
    # act
    send_to_station = robot.station
    # assert
    assert_equal(send_to_station, 2)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    @robot = Robot.new
    @robot.needs_repairs = true
    @robot.foreign_model = false
    @robot.vintage_model = false
    # act
    send_to_station = robot.station
    # assert
    assert_equal(send_to_station, 3)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    @robot = Robot.new
    @robot.needs_repairs = false
    @robot.foreign_model = false
    @robot.vintage_model = false
    # act
    send_to_station = robot.station
    # assert
    assert_equal(send_to_station, 4)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    @robot = Robot.new
    # act
    do_stuff = robot.prioritize_tasks
    # assert
    assert_equal(do_stuff, -1)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    @robot = Robot.new
    robot.todos = [1]
    # act
    do_stuff = robot.prioritize_tasks
    # assert
    assert_equal(do_stuff, 1)
  end

  def test_workday_on_day_off_returns_true
    # arrange
    @robot = Robot.new
    today = (robot.day_off == false)
    # act
    working = robot.workday?(today)
    # assert
    assert_equal(working, true)
  end

  def test_workday_not_day_off_returns_false
    # arrange
    @robot = Robot.new
    today = (robot.day_off == true)
    # act
    working = robot.workday?(today)
    # assert
    assert_equal(working, true)
  end

end
