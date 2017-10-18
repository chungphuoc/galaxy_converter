require "helper"

describe GalaxyConverter::Calculator do
  it "must compute a total of 42" do
    calculator = GalaxyConverter::Calculator.new("pish tegj glob glob")
    calculator.call.must_equal 42
  end

  it "must compute 34 credits" do
    calculator = GalaxyConverter::Calculator.new("glob glob", 17)
    calculator.call.must_equal 34
  end

  it "must compute 57800 credits" do
    calculator = GalaxyConverter::Calculator.new("glob prok", 14450)
    calculator.call.must_equal 57800
  end

  it "must compute 3910 credits" do
    calculator = GalaxyConverter::Calculator.new("pish pish", 195.5)
    calculator.call.must_equal 3910
  end

  it "must ignore invalid units" do
    calculator = GalaxyConverter::Calculator.new("glob glob doh!", 17)
    calculator.call.must_equal 34
  end
end
