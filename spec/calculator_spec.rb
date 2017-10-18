require "helper"

describe GalaxyConverter::Calculator do
  it "must compute a total of 42" do
    calculator = GalaxyConverter::Calculator.new("pish tegj glob glob")
    calculator.call.must_equal 42
  end

  it "must compute 34 credits" do
    calculator = GalaxyConverter::Calculator.new("glob glob", "Silver")
    calculator.call.must_equal 34
  end

  it "must compute 57800 credits" do
    calculator = GalaxyConverter::Calculator.new("glob prok", "Gold")
    calculator.call.must_equal 57800
  end

  it "must compute 3910 credits" do
    calculator = GalaxyConverter::Calculator.new("pish pish", "Iron")
    calculator.call.must_equal 3910
  end

  it "must compute 68 credits" do
    calculator = GalaxyConverter::Calculator.new("glob prok", "Silver")
    calculator.call.must_equal 68
  end

  it "must compute 782 credits" do
    calculator = GalaxyConverter::Calculator.new("glob prok", "Iron")
    calculator.call.must_equal 782
  end

  it "must ignore invalid units" do
    calculator = GalaxyConverter::Calculator.new("glob glob doh!", "Silver")
    calculator.call.must_equal 34
  end

  it "must discard junk metal" do
    calculator = GalaxyConverter::Calculator.new("glob prok", "Platinum")
    calculator.call.must_equal 0
  end
end
