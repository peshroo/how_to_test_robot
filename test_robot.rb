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

    # assert
    assert @robot.station == 1
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    @robot = Robot.new
    @robot.needs_repairs = true
    @robot.foreign_model = false
    @robot.vintage_model = true
    # act

    # assert
    assert @robot.station == 2
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    @robot = Robot.new
    @robot.needs_repairs = true
    @robot.foreign_model = false
    @robot.vintage_model = false
    # act

    # assert
    assert @robot.station == 3
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    @robot = Robot.new
    @robot.needs_repairs = false
    @robot.foreign_model = false
    @robot.vintage_model = false
    # act

    # assert
    assert @robot.station == 4
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange

    # act

    # assert
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange

    # act

    # assert
  end

  def test_workday_on_day_off_returns_true
    # arrange

    # act

    # assert
  end

  def test_workday_not_day_off_returns_false
    # arrange

    # act

    # assert
  end

end
