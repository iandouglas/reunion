require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_it_exists
    reunion = Reunion.new('here')
    assert_instance_of Reunion, reunion
  end

  def test_attributes
    reunion = Reunion.new('here')
    assert_equal 'here', reunion.location
    assert reunion.activities.empty?
  end

  def test_add_activities
    reunion = Reunion.new('here')
    reunion.add_activity(Activity.new('hiking', 50))
    assert_equal 1, reunion.activities.length
    assert_equal 'hiking', reunion.activities[0].name
  end

  def test_total_cost
    reunion = Reunion.new('here')
    reunion.add_activity(Activity.new('hiking', 50))
    assert_equal 50, reunion.total_cost
  end

  def test_reunion_divvy
    reunion = Reunion.new('here')

    activity = Activity.new('hiking', 20)
    activity.add_participiant('ian', 10)
    activity.add_participiant('brian', 8)
    reunion.add_activity(activity)

    activity = Activity.new('deep sea fishing', 30)
    activity.add_participiant('ian', 14)
    activity.add_participiant('brian', 18)
    reunion.add_activity(activity)

    reunion_divvy = reunion.divvy
    assert_equal 1, reunion_divvy['ian']
    assert_equal -1, reunion_divvy['brian']
  end
end
