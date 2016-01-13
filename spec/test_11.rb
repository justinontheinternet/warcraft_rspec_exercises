require_relative 'spec_helper'


describe Barracks do
  
  before :each do
    @barracks = Barracks.new
  end

  it "has and knows its HP (health_points)" do
    expect(@barracks.health_points).to eq(500)
  end

  describe "#damage" do
    it "should reduce the barrack's health by half if attacked by footman" do
      footman = Footman.new
      footman.attack!(@barracks)
      expect(@barracks.health_points).to eq(495)
    end
  end

end