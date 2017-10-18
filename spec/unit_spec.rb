require "helper"

describe GalaxyConverter::Unit do
  it "must create bulk units instances" do
    GalaxyConverter::Unit.bulk("pish tegj glob pish").each do |unit|
      unit.must_be_instance_of GalaxyConverter::Unit
    end
  end

  it "must fetch value of units" do
    GalaxyConverter::Unit::SYMBOLS.each do |name,  value|
      GalaxyConverter::Unit.new(name).to_i.must_equal value
    end
  end

  it "must discard invalid names" do
    GalaxyConverter::Unit.new("doh!").to_i.must_equal 0
  end
end
