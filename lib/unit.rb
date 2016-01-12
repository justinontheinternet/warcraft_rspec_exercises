class Unit

  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(target)
    target.damage(@attack_power)
  end

  def damage(opponent_power)
    @health_points -= opponent_power
  end


end