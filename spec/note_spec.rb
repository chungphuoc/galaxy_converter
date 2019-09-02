require "helper"

describe GalaxyConverter::Note do
  it "must create instances from list" do
    notes = GalaxyConverter::Note.from(["glob is I", "glob glob Silver is 34 Credits", "how much is pish tegj glob glob ?"])
    notes[0].must_be_instance_of GalaxyConverter::Note
    notes[1].must_be_instance_of GalaxyConverter::Credit
    notes[2].must_be_instance_of GalaxyConverter::Note
  end

  it "must detect questions" do
    GalaxyConverter::Note.new("How much is this?").question?.must_equal true
    GalaxyConverter::Note.new("How many credits is that?").question?.must_equal true
    GalaxyConverter::Note.new("how much wood could a woodchuck chuck if a woodchuck could chuck wood ?").question?.must_equal true
    GalaxyConverter::Note.new("prok is V").question?.must_equal false
  end

  it "must detect units and good" do
    note = GalaxyConverter::Note.new("how much is pish tegj glob glob ?")
    note.units.must_equal "pish tegj glob glob"
    note.good.must_be_nil
  end

  it "must build proper answer" do
    note = GalaxyConverter::Note.new("how much is pish tegj glob glob ?")
    note.answer(42).must_equal "pish tegj glob glob is 42"
  end

  it "must build no idea answer" do
    note = GalaxyConverter::Note.new("how much wood could a woodchuck chuck if a woodchuck could chuck wood ?")
    note.answer.must_equal "I have no idea what you are talking about"
  end
end

describe GalaxyConverter::Credit do
  it "must detect units and good" do
    note = GalaxyConverter::Credit.new("how many Credits is glob prok Silver ?")
    note.units.must_equal "glob prok"
    note.good.must_equal "silver"
  end

  it "must build proper answer" do
    note = GalaxyConverter::Credit.new("how many Credits is glob prok Silver ?")
    note.answer(68).must_equal "glob prok Silver is 68 Credits"
  end
end
