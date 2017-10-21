require "helper"

describe GalaxyConverter::Responder do
  let(:notes) { GalaxyConverter::Note.bulk(Stubs::NOTES) }
  let(:wrong_notes) { GalaxyConverter::Note.bulk(Stubs::WRONG_NOTES) }

  it "must provide answers" do
    answers = GalaxyConverter::Responder.new(notes).call
    answers[0].must_equal "pish tegj glob glob is 42"
    answers[1].must_equal "glob prok Silver is 68 Credits"
    answers[2].must_equal "glob prok Gold is 57800 Credits"
    answers[3].must_equal "glob prok Iron is 782 Credits"
    answers[4].must_equal GalaxyConverter::Responder::UNKNOWN_ANSWER
  end

  it "must try to privide answers" do
    answers = GalaxyConverter::Responder.new(wrong_notes).call
    answers[0].must_equal GalaxyConverter::Responder::UNKNOWN_ANSWER
    answers[1].must_equal GalaxyConverter::Responder::UNKNOWN_ANSWER
    answers[2].must_equal "drok gork Rodium is 600 Credits"
    answers[3].must_equal GalaxyConverter::Responder::UNKNOWN_ANSWER
  end
end
