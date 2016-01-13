require_relative 'spec_helper'

describe Unit do

  before :each do
    @unit = Unit.new(30,5)
  end

  describe "#dead" do
  
    it "should be alive if health_points is greater than 0" do
      expect(@unit).to receive(:health_points).and_return(5)
      expect(@unit.dead?).to be_falsey
    end

    it "should die if health_points is 0 or lower" do
      expect(@unit).to receive(:health_points).and_return(0)
      expect(@unit.dead?).to be_truthy 
    end
  end

end