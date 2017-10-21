require "helper"

describe GalaxyConverter::Note do
  it "must create instances in bulk" do
    GalaxyConverter::Note.bulk(Stubs::NOTES).each do |note|
      note.must_be_instance_of GalaxyConverter::Note
    end
  end

  it "must detect valid question" do
    GalaxyConverter::Note.new("How much is this?").question?.must_equal true
    GalaxyConverter::Note.new("How many credits is that?").question?.must_equal true
    GalaxyConverter::Note.new("how much wood could a woodchuck chuck if a woodchuck could chuck wood ?").question?.must_equal true
    GalaxyConverter::Note.new("prok is V").question?.must_equal false
  end

  it "must detect commercial note" do
    GalaxyConverter::Note.new("How many credits is that?").commercial?.must_equal true
  end

  it "must strip question indicators" do
    note = GalaxyConverter::Note.new("how many Credits is glob prok Silver ?")
    note.stripped.must_equal "glob prok silver"
  end
end
