class SiegeEngine

  attr_reader :health_points, :attack_power

  def initialize(parent_barrack)
    @health_points = 400
    @attack_power = 50
    parent_barrack.gold -= 200
    parent_barrack.lumber -= 60
    parent_barrack.food -= 3
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

  def can_attack?(target)
    health_points >= 0 && target.health_points >= 0 && target.class.superclass != Unit
  end
end