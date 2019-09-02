require "helper"

describe GalaxyConverter::Detector do
  it "must detect value of silver" do
    notes = GalaxyConverter::Note.from(["glob is I", "glob glob Silver is 34 Credits"])
    recognizer = GalaxyConverter::Detector.new(notes)
    recognizer.goods.must_equal({"silver" => 17.0})
  end

  it "must detect value of gold" do
    notes = GalaxyConverter::Note.from(["glob is I", "prok is V", "glob prok Gold is 57800 Credits"])
    recognizer = GalaxyConverter::Detector.new(notes)
    recognizer.goods.must_equal({"gold" => 14450.0})
  end

  it "must detect value of iron" do
    notes = GalaxyConverter::Note.from(["pish is X", "pish pish Iron is 3910 Credits"])
    recognizer = GalaxyConverter::Detector.new(notes)
    recognizer.goods.must_equal({"iron" => 195.5})
  end

  it "must detect nothing on invalid units" do
    notes = GalaxyConverter::Note.from(["pish is U", "pish pish Iron is 3910 Credits"])
    recognizer = GalaxyConverter::Detector.new(notes)
    recognizer.goods.must_be_empty
  end
end
