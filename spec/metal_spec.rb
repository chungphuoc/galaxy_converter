require "helper"

describe GalaxyConverter::Metal do
  it "must fetch value of Silver" do
    metal = GalaxyConverter::Metal.new("Silver")
    metal.credits.must_equal 17
  end

  it "must fetch value of Iron" do
    metal = GalaxyConverter::Metal.new("Iron")
    metal.credits.must_equal 195.5
  end

  it "must fetch value of Gold" do
    metal = GalaxyConverter::Metal.new("Gold")
    metal.credits.must_equal 14450
  end

  it "must relax on capitalization" do
    metal = GalaxyConverter::Metal.new("iron")
    metal.credits.must_equal 195.5
  end

  it "must relax on case" do
    metal = GalaxyConverter::Metal.new("SILVER")
    metal.credits.must_equal 17
  end

  it "must dicard valueless metals" do
    metal = GalaxyConverter::Metal.new("platinum")
    metal.credits.must_equal 0
  end

  it "must support multiplication" do
    metal = GalaxyConverter::Metal.new("iron")
    (metal * 20).must_equal 3910.0
  end

  it "must relax on invalid multiplicand" do
    metal = GalaxyConverter::Metal.new("iron")
    (metal * "doh!").must_equal 0
  end
end
