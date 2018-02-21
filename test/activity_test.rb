require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new('hiking', 50)
    assert_instance_of Activity, activity
  end

  def test_attributes
    activity = Activity.new('hiking', 50)
    assert_equal 50, activity.cost
    assert activity.participants.empty?
  end

  def test_add_participant
    activity = Activity.new('hiking', 50)
    activity.add_participiant('ian', 5)
    refute activity.participants.empty?
  end

  def test_count_money
    activity = Activity.new('hiking', 50)
    activity.add_participiant('ian', 5)
    assert_equal 5, activity.total_money
  end

  def test_fair_share
    activity = Activity.new('hiking', 30)
    activity.add_participiant('ian', 10)
    activity.add_participiant('brian', 8)
    activity.add_participiant('mike', 12)
    assert_equal 10, activity.fair_share
  end

  def test_divvy
    activity = Activity.new('hiking', 30)
    activity.add_participiant('ian', 10)
    activity.add_participiant('brian', 8)
    activity.add_participiant('mike', 12)
    divvy = activity.divvy
    assert_equal 0, divvy['ian']
    assert_equal 2, divvy['brian']
    assert_equal -2, divvy['mike']
  end
end
