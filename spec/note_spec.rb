require "helper"

describe GalaxyConverter::Note do
  it "must create instances from list" do
    notes = ["glob is I", "glob glob Silver is 34 Credits", "how much is pish tegj glob glob ?"]
    GalaxyConverter::Note.from(notes).each do |note|
      note.must_be_instance_of GalaxyConverter::Note
    end
  end

  it "must detect questions" do
    GalaxyConverter::Note.new("How much is this?").question?.must_equal true
    GalaxyConverter::Note.new("How many credits is that?").question?.must_equal true
    GalaxyConverter::Note.new("how much wood could a woodchuck chuck if a woodchuck could chuck wood ?").question?.must_equal true
    GalaxyConverter::Note.new("prok is V").question?.must_equal false
  end

  it "must detect commercials" do
    GalaxyConverter::Note.new("How many Credits is that?").commercial?.must_equal true
  end

  it "must detect units" do
    note = GalaxyConverter::Note.new("how much is pish tegj glob glob ?")
    note.units.must_equal "pish tegj glob glob"
    note.good.must_be_nil
  end

  it "must detect units and good" do
    note = GalaxyConverter::Note.new("how many Credits is glob prok Silver ?")
    note.units.must_equal "glob prok"
    note.good.must_equal "silver"
  end

  it "must build proper answer" do
    note = GalaxyConverter::Note.new("how many Credits is glob prok Silver ?")
    note.answer(68).must_equal "glob prok Silver is 68 Credits"
  end

  it "must build no idea answer" do
    note = GalaxyConverter::Note.new("how much wood could a woodchuck chuck if a woodchuck could chuck wood ?")
    note.answer.must_equal "I have no idea what you are talking about"
  end
end
