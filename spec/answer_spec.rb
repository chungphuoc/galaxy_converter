require "helper"

describe GalaxyConverter::Answer do
  it "must answer with unknown for invalid questions" do
    question = GalaxyConverter::Question.new("how much wood could a woodchuck chuck if a woodchuck could chuck wood ?")
    answer = GalaxyConverter::Answer.new(question)
    answer.to_s.must_equal GalaxyConverter::Answer::UNKNOWN
  end

  it "must answer 42" do
    question = GalaxyConverter::Question.new("how much is pish tegj glob glob ?")
    answer = GalaxyConverter::Answer.new(question)
    answer.to_s.must_equal "pish tegj glob glob is 42"
  end

  it "must answer 68 credits" do
    question = GalaxyConverter::Question.new("how many Credits is glob prok Silver ?")
    answer = GalaxyConverter::Answer.new(question)
    answer.to_s.must_equal "glob prok Silver is 68 Credits"
  end

  it "must answer 57800 credits" do
    question = GalaxyConverter::Question.new("how many Credits is glob prok Gold ?")
    answer = GalaxyConverter::Answer.new(question)
    answer.to_s.must_equal "glob prok Gold is 57800 Credits"
  end

  it "must answer 782 credits" do
    question = GalaxyConverter::Question.new("how many Credits is glob prok Iron ?")
    answer = GalaxyConverter::Answer.new(question)
    answer.to_s.must_equal "glob prok Iron is 782 Credits"
  end
end
