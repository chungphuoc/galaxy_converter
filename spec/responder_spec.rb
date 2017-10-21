require "helper"

describe GalaxyConverter::Responder do
  let(:notes) { GalaxyConverter::Note.bulk(Stubs::NOTES) }
  let(:responder) { GalaxyConverter::Responder.new(notes) }

  it "must provide answers" do
    answers = responder.call
    answers[0].must_equal "pish tegj glob glob is 42"
    answers[1].must_equal "glob prok Silver is 68 Credits"
    answers[2].must_equal "glob prok Gold is 57800 Credits"
    answers[3].must_equal "glob prok Iron is 782 Credits"
    answers[4].must_equal "I have no idea what you are talking about"
  end
end
