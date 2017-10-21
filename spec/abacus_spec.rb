require "helper"

describe GalaxyConverter::Abacus do
  let(:abacus) { GalaxyConverter::Abacus.new({"glob"=>"I", "prok"=>"V", "pish"=>"X", "tegj"=>"L"}) }

  it "must fetch value of 42" do
    abacus.call("pish tegj glob glob").must_equal 42
  end

  it "must fetch value of 59" do
    abacus.call("tegj glob pish").must_equal 59
  end
end
