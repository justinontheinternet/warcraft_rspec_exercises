class Unit

  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def attack!(target)
    if can_attack?(target)
      target.damage(self)
    end
  end

  def damage(enemy)
    @health_points -= enemy.attack_power
  end

  private

  def dead?
    health_points <= 0
  end

   def can_attack?(target)
    dead? == false && target.health_points > 0
  end


end