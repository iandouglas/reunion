class Activity
  attr_reader :name, :participants, :cost
  def initialize(name, cost)
    @name = name
    @cost = cost
    @participants = Hash.new(0)
  end

  def add_participiant(name, money)
    @participants[name] = money
  end

  def total_money
    @participants.map {|name, money| money}.sum
  end

  def fair_share
    return 0 if @participants.empty?
    @cost / @participants.keys.length
  end

  def divvy
    fs = fair_share
    who_owes_what = Hash.new(0)
    @participants.each do |name, money|
      who_owes_what[name] = fs - money
    end
    who_owes_what
  end
end
