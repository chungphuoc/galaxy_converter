require "helper"

describe GalaxyConverter::Metal do
  it "must be respresented as a string" do
    metal = GalaxyConverter::Metal.new("iron")
    metal.to_s.must_equal "Iron"
  end

  it "must detect nil value" do
    metal = GalaxyConverter::Metal.new(nil)
    metal.must_be_nil
  end

  it "must support multiplication" do
    metal = GalaxyConverter::Metal.new("iron")
    (metal * 20).must_equal 3910.0
  end

  it "must relax on invalid multiplicand" do
    metal = GalaxyConverter::Metal.new("iron")
    (metal * "doh!").must_equal 0
  end

  it "must relax on invalid metal" do
    metal = GalaxyConverter::Metal.new(nil)
    (metal * "doh!").must_equal 0
  end
end
