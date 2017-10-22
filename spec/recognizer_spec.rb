require "helper"

describe GalaxyConverter::Recognizer do
  let(:notes) { GalaxyConverter::Note.bulk(Stubs::NOTES) }
  let(:wrong_notes) { GalaxyConverter::Note.bulk(Stubs::WRONG_NOTES) }

  it "must detect goods values" do
    GalaxyConverter::Recognizer.new(notes).goods.must_equal({"silver"=>17.0, "gold"=>14450.0, "iron"=>195.5})
    GalaxyConverter::Recognizer.new(wrong_notes).goods.must_equal({"rodium"=>100.0})
  end
end
