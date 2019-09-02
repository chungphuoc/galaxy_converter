require "helper"

describe GalaxyConverter::Converter do
  let(:converter) { GalaxyConverter::Converter.new({"glob"=>"I", "prok"=>"V", "pish"=>"X", "tegj"=>"L"}) }

  it "must fetch value of 42" do
    converter.call("pish tegj glob glob").must_equal 42
  end

  it "must fetch value of 59" do
    converter.call("tegj glob pish").must_equal 59
  end

  it "must fetch value of 76" do
    converter.call("tegj pish pish prok glob").must_equal 76
  end

  it "must return 0 for invalid sequence" do
    converter.call("prok prok").must_equal 0
  end

  it "must strip invalid mapping" do
    converter.call("gork prok").must_equal 5
  end

  it "must return 0 for invalid mapping" do
    converter.call("gork pork").must_equal 0
  end
end
