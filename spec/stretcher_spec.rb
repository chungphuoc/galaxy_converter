require "helper"

describe GalaxyConverter::Stretcher do
  it "must preserve 2" do
    GalaxyConverter::Stretcher.call("II").must_equal "II"
  end

  it "must convert 4" do
    GalaxyConverter::Stretcher.call("IV").must_equal "IIII"
  end

  it "must convert 9" do
    GalaxyConverter::Stretcher.call("IX").must_equal "VIIII"
  end

  it "must convert 49" do
    GalaxyConverter::Stretcher.call("XLIX").must_equal "XXXXVIIII"
  end

  it "must convert 99" do
    GalaxyConverter::Stretcher.call("XCIX").must_equal "LXXXXVIIII"
  end

  it "must convert 449" do
    GalaxyConverter::Stretcher.call("CDXLIX").must_equal "CCCCXXXXVIIII"
  end

  it "must convert 999" do
    GalaxyConverter::Stretcher.call("XCIX").must_equal "LXXXXVIIII"
  end
end
