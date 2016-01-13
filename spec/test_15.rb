require_relative 'spec_helper'

describe SiegeEngine do
  
  before :each do
    @barrack = Barracks.new
    @siege_engine = SiegeEngine.new(@barrack)
  end


  it "has and knows it's attack power" do
    expect(@siege_engine.attack_power).to eq(50)
  end

  it "has and knows its health (health_points)" do
    expect(@siege_engine.health_points).to eq(400)
  end

  it "should cost the parent barracks 200 gold, 60 lumber, and 3 food to create" do
    expect(@barrack.gold).to eq(800)
    expect(@barrack.lumber).to eq(440)
    expect(@barrack.food).to eq(77)
  end


  describe "#attack!" do
    
    it "should not attack units on foot" do
      enemy_footman = Footman.new
      @siege_engine.attack!(enemy_footman)
      expect(enemy_footman.health_points).to eq(60)
    end

    it "should attack another Siege Engine" do
      parent_barrack = Barracks.new
      enemy_engine = SiegeEngine.new(parent_barrack)
      @siege_engine.attack!(enemy_engine)
      expect(enemy_engine.health_points).to eq(350)
    end

    it "should do double the damage to a barracks" do
      barrack = Barracks.new
      @siege_engine.attack!(barrack)
      expect(barrack.health_points).to eq(400)
    end
  end

end