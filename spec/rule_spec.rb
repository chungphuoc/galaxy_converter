require "helper"

describe GalaxyConverter::Rule do
  it "must preserve 3" do
    GalaxyConverter::Rule.new("glob glob glob").subtractive.must_equal "glob glob glob"
    GalaxyConverter::Rule.new("glob glob glob").additive.must_equal "glob glob glob"
  end

  it "must convert 4" do
    GalaxyConverter::Rule.new("pish pish pish pish").subtractive.must_equal "pish tegj"
    GalaxyConverter::Rule.new("pish tegj").additive.must_equal "pish pish pish pish"
  end

  it "must convert 9" do
    GalaxyConverter::Rule.new("prok glob glob glob glob").subtractive.must_equal "glob pish"
    GalaxyConverter::Rule.new("glob pish").additive.must_equal "prok glob glob glob glob"
  end

  it "must preserve 30" do
    GalaxyConverter::Rule.new("pish pish pish").subtractive.must_equal "pish pish pish"
    GalaxyConverter::Rule.new("pish pish pish").additive.must_equal "pish pish pish"
  end

  it "must convert 49" do
    GalaxyConverter::Rule.new("pish pish pish pish prok glob glob glob glob").subtractive.must_equal "pish tegj glob pish"
    GalaxyConverter::Rule.new("pish tegj glob pish").additive.must_equal "pish pish pish pish prok glob glob glob glob"
  end
end
