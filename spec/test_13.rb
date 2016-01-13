require_relative 'spec_helper'

describe Unit do

  before :each do
    @unit = Unit.new(30, 5)
    @enemy_unit = Unit.new(50,5)
  end

  describe "#attack!" do
    
    it "should not attack a dead target" do
      allow(@enemy_unit).to receive(:health_points).and_return(0)
      expect(@unit.attack!(@enemy_unit)).to be_falsey
    end

    it "should not attack a target if unit itself is dead" do
      allow(@unit).to receive(:health_points).and_return(0)
      expect(@unit.attack!(@enemy_unit)).to be_falsey
      expect(@enemy_unit.health_points).to eq(50)
    end

    it "should attack a target if both are alive" do
      @unit.attack!(@enemy_unit)
      expect(@enemy_unit.health_points).to eq(45)
    end

  end
end