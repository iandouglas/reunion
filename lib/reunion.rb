class Reunion
  attr_reader :location, :activities
  def initialize(location)
    @location = location
    @activities = []
  end

  def add_activity(activity)
    @activities << activity
  end

  def total_cost
    @activities.map(&:cost).sum
  end

  def divvy
    guests = Hash.new(0)
    @activities.each do |activity|
      activity.divvy.each_pair do |name, money|
        guests[name] += money
      end
    end
    guests
  end

end
