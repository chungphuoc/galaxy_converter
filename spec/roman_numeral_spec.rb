require "helper"

describe GalaxyConverter::Roman::Numeral do
  let(:klass) { GalaxyConverter::Roman::Numeral }

  it "must represent 1" do
    klass.to_roman(1).to_s.must_equal "I"
    klass.new("I").to_i.must_equal 1
  end

  it "must represent 2" do
    klass.to_roman(2).to_s.must_equal "II"
    klass.new("II").to_i.must_equal 2
  end

  it "must represent 3" do
    klass.to_roman(3).to_s.must_equal "III"
    klass.new("III").to_i.must_equal 3
  end

  it "must represent 4" do
    klass.to_roman(4).to_s.must_equal "IV"
    klass.new("IV").to_i.must_equal 4
  end

  it "must represent 5" do
    klass.to_roman(5).to_s.must_equal "V"
    klass.new("V").to_i.must_equal 5
  end

  it "must represent 9" do
    klass.to_roman(9).to_s.must_equal "IX"
    klass.new("IX").to_i.must_equal 9
  end

  it "must represent 27" do
    klass.to_roman(27).to_s.must_equal "XXVII"
    klass.new("XXVII").to_i.must_equal 27
  end

  it "must represent 49" do
    klass.to_roman(49).to_s.must_equal "XLIX"
    klass.new("XLIX").to_i.must_equal 49
  end

  it "must represent 163" do
    klass.to_roman(163).to_s.must_equal "CLXIII"
    klass.new("CLXIII").to_i.must_equal 163
  end

  it "must represent 402" do
    klass.to_roman(402).to_s.must_equal "CDII"
    klass.new("CDII").to_i.must_equal 402
  end

  it "must represent 911" do
    klass.to_roman(911).to_s.must_equal "CMXI"
    klass.new("CMXI").to_i.must_equal 911
  end

  it "must represent 3000" do
    klass.to_roman(3000).to_s.must_equal "MMM"
    klass.new("MMM").to_i.must_equal 3000
  end

  it "must detect valid numeral" do
    klass.new("CMXI").valid?.must_equal true
  end

  it "must detect invalid numeral" do
    klass.new("XXXX").valid?.must_equal false
  end
end
