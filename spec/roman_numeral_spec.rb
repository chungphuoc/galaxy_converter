require "helper"

describe GalaxyConverter::RomanNumeral do
  it "must represent 1" do
    GalaxyConverter::RomanNumeral.new("I").to_i.must_equal 1
  end

  it "must represent 2" do
    GalaxyConverter::RomanNumeral.new("II").to_i.must_equal 2
  end

  it "must represent 3" do
    GalaxyConverter::RomanNumeral.new("III").to_i.must_equal 3
  end

  it "must represent 4" do
    GalaxyConverter::RomanNumeral.new("IV").to_i.must_equal 4
  end

  it "must represent 5" do
    GalaxyConverter::RomanNumeral.new("V").to_i.must_equal 5
  end

  it "must represent 9" do
    GalaxyConverter::RomanNumeral.new("IX").to_i.must_equal 9
  end

  it "must represent 27" do
    GalaxyConverter::RomanNumeral.new("XXVII").to_i.must_equal 27
  end

  it "must represent 49" do
    GalaxyConverter::RomanNumeral.new("XLIX").to_i.must_equal 49
  end

  it "must represent 163" do
    GalaxyConverter::RomanNumeral.new("CLXIII").to_i.must_equal 163
  end

  it "must represent 402" do
    GalaxyConverter::RomanNumeral.new("CDII").to_i.must_equal 402
  end

  it "must represent 911" do
    GalaxyConverter::RomanNumeral.new("CMXI").to_i.must_equal 911
  end

  it "must represent 1903" do
    GalaxyConverter::RomanNumeral.new("MCMIII").to_i.must_equal 1903
  end

  it "must represent 3000" do
    GalaxyConverter::RomanNumeral.new("MMM").to_i.must_equal 3000
  end

  it "must detect invalid numeral" do
    GalaxyConverter::RomanNumeral.new("XXXX").to_i.must_equal 0
  end
end
