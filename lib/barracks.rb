class Barracks

  attr_accessor :gold, :food, :lumber
  attr_reader :health_points

  def initialize
    @gold = 1000
    @food = 80
    @health_points = 500
    @lumber = 500
  end


  def train_footman
    if self.can_train_footman?
      @gold -= 135
      @food -= 2
      Footman.new
    else
      puts "Not enough resources."
    end
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

  def damage(enemy)
    if enemy.is_a? Footman
      @health_points -= (enemy.attack_power / 2).ceil
    elsif enemy.is_a? SiegeEngine
      @health_points -= (enemy.attack_power * 2)
    end
  end

  def create_siege_engine
    SiegeEngine.new(self)
  end

  private

  def can_train_footman?
    food >= 2 && gold >= 135    #food is the method because inside an instance,
  end                           #self = that particular instance. Same as calling self.food. This lets rspec access the info.

  def can_train_peasant?
    gold >= 90 && food >= 5
  end

end
