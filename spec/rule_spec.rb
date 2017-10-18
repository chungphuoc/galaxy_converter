require "helper"

describe GalaxyConverter::Rule do
  it "must preserve 3" do
    GalaxyConverter::Rule.call("glob glob glob").must_equal "glob glob glob"
  end

  it "must convert 4" do
    GalaxyConverter::Rule.call("pish tegj").must_equal "pish pish pish pish"
  end

  it "must convert 9" do
    GalaxyConverter::Rule.call("glob pish").must_equal "prok glob glob glob glob"
  end

  it "must preserve 30" do
    GalaxyConverter::Rule.call("pish pish pish").must_equal "pish pish pish"
  end

  it "must convert 49" do
    GalaxyConverter::Rule.call("pish tegj glob pish").must_equal "pish pish pish pish prok glob glob glob glob"
  end
end
