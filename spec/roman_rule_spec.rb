require "helper"

describe GalaxyConverter::Roman::Rule do
  it "must preserve 2" do
    "II".must_equal GalaxyConverter::Roman::Rule.new("II").to_subtractive
    "II".must_equal GalaxyConverter::Roman::Rule.new("II").to_additive
  end

  it "must convert 4" do
    "IV".must_equal GalaxyConverter::Roman::Rule.new("IIII").to_subtractive
    "IIII".must_equal GalaxyConverter::Roman::Rule.new("IV").to_additive
  end

  it "must convert 9" do
    "IX".must_equal GalaxyConverter::Roman::Rule.new("VIIII").to_subtractive
    "VIIII".must_equal GalaxyConverter::Roman::Rule.new("IX").to_additive
  end

  it "must convert 49" do
    "XLIX".must_equal GalaxyConverter::Roman::Rule.new("XXXXVIIII").to_subtractive
    "XXXXVIIII".must_equal GalaxyConverter::Roman::Rule.new("XLIX").to_additive
  end

  it "must convert 99" do
    "XCIX".must_equal GalaxyConverter::Roman::Rule.new("LXXXXVIIII").to_subtractive
    "LXXXXVIIII".must_equal GalaxyConverter::Roman::Rule.new("XCIX").to_additive
  end

  it "must convert 449" do
    "CDXLIX".must_equal GalaxyConverter::Roman::Rule.new("CCCCXXXXVIIII").to_subtractive
    "CCCCXXXXVIIII".must_equal GalaxyConverter::Roman::Rule.new("CDXLIX").to_additive
  end

  it "must convert 999" do
    "XCIX".must_equal GalaxyConverter::Roman::Rule.new("LXXXXVIIII").to_subtractive
    "LXXXXVIIII".must_equal GalaxyConverter::Roman::Rule.new("XCIX").to_additive
  end
end
