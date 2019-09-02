require "helper"

describe GalaxyConverter::Responder do
  it "must provide answers to dtected values" do
    notes = GalaxyConverter::Note.from(["glob is I", "prok is V", "pish is X", "tegj is L", "glob glob Silver is 34 Credits", "glob prok Gold is 57800 Credits", "pish pish Iron is 3910 Credits", "how much is pish tegj glob glob ?", "how many Credits is glob prok Silver ?", "how many Credits is glob prok Gold ?", "how many Credits is glob prok Iron ?", "how much wood could a woodchuck chuck if a woodchuck could chuck wood ? "])
    answers = GalaxyConverter::Responder.new(notes).call
    answers[0].must_equal "pish tegj glob glob is 42"
    answers[1].must_equal "glob prok Silver is 68 Credits"
    answers[2].must_equal "glob prok Gold is 57800 Credits"
    answers[3].must_equal "glob prok Iron is 782 Credits"
    answers[4].must_equal "I have no idea what you are talking about"
  end
end
