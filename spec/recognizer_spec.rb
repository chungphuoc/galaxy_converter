require "helper"

describe GalaxyConverter::Recognizer do
  let(:notes) { GalaxyConverter::Note.bulk(Stubs::NOTES) }
  let(:recognizer) { GalaxyConverter::Recognizer.new(notes) }

  it "must detect metals values" do
    recognizer.metals.must_equal({"silver"=>17.0, "gold"=>14450.0, "iron"=>195.5})
  end
end
