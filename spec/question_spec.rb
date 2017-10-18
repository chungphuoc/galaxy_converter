require "helper"

describe GalaxyConverter::Question do
  it "must create instances in bulk" do
    GalaxyConverter::Question.bulk(["How much is this?", "how many credits is that?"]).each do |unit|
      unit.must_be_instance_of GalaxyConverter::Question
    end
  end

  it "must detect valid question" do
    ["How much is this?", "how many credits is that?"].each do |body|
      question = GalaxyConverter::Question.new(body)
      question.valid?.must_equal true
    end
  end

  it "must detect invalid question" do
    question = GalaxyConverter::Question.new("how much?")
    question.valid?.must_equal false
  end

  it "must detect mark" do
    question = GalaxyConverter::Question.new("tegj is L")
    question.valid?.must_equal false
    question.mark?.must_equal false
  end

  it "must extract units" do
    question = GalaxyConverter::Question.new("How much is pish tegj glob glob trish ?")
    question.units.must_equal "pish tegj glob glob trish"
    question.metal.must_be_nil
  end

  it "must extract units and metal" do
    question = GalaxyConverter::Question.new("how many Credits is glob prok Platinum  ?")
    question.units.must_equal "glob prok"
    question.metal.to_s.must_equal "Platinum"
  end
end
