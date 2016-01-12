class Barracks

  attr_accessor :gold, :food

  def initialize
    @gold = 1000
    @food = 80
  end

  def can_train_footman?
    food >= 2 && gold >= 135    #food is the method because inside an instance,
  end                           #self = that particular instance. Same as calling self.food. This lets rspec access the info.

  def train_footman
    if self.can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    else
      puts "Not enough resources."
    end
  end

  def can_train_peasant?
    gold >= 90 && food >= 5
  end

  def train_peasant
    if can_train_peasant?
      @gold -= 90
      @food -= 5
      Peasant.new
    else
      puts "Not enough resources."
    end
  end

end
