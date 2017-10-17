require "helper"

describe GalaxyConverter::Unit do
  it "must fetch value of units" do
    GalaxyConverter::Unit::SYMBOLS.each do |name,  value|
      GalaxyConverter::Unit.new(name).to_i.must_equal value
    end
  end

  it "must discard invalid names" do
    GalaxyConverter::Unit.new("doh!").to_i.must_equal 0
  end
end
