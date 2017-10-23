require "helper"

describe GalaxyConverter::Roman::Rule do
  let(:klass) { GalaxyConverter::Roman::Rule }

  it "must preserve 2" do
    klass.call("II").must_equal "II"
  end

  it "must convert 4" do
    klass.call("IV").must_equal "IIII"
  end

  it "must convert 9" do
    klass.call("IX").must_equal "VIIII"
  end

  it "must convert 49" do
    klass.call("XLIX").must_equal "XXXXVIIII"
  end

  it "must convert 99" do
    klass.call("XCIX").must_equal "LXXXXVIIII"
  end

  it "must convert 449" do
    klass.call("CDXLIX").must_equal "CCCCXXXXVIIII"
  end

  it "must convert 999" do
    klass.call("XCIX").must_equal "LXXXXVIIII"
  end
end
