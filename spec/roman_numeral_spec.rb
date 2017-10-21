require "helper"

describe GalaxyConverter::Roman::Numeral do
  let(:klass) { GalaxyConverter::Roman::Numeral }

  it "must represent 1" do
    klass.to_roman(1).must_equal "I"
    klass.to_i("I").must_equal 1
  end

  it "must represent 2" do
    klass.to_roman(2).must_equal "II"
    klass.to_i("II").must_equal 2
  end

  it "must represent 3" do
    klass.to_roman(3).must_equal "III"
    klass.to_i("III").must_equal 3
  end

  it "must represent 4" do
    klass.to_roman(4).must_equal "IV"
    klass.to_i("IV").must_equal 4
  end

  it "must represent 5" do
    klass.to_roman(5).must_equal "V"
    klass.to_i("V").must_equal 5
  end

  it "must represent 9" do
    klass.to_roman(9).must_equal "IX"
    klass.to_i("IX").must_equal 9
  end

  it "must represent 27" do
    klass.to_roman(27).must_equal "XXVII"
    klass.to_i("XXVII").must_equal 27
  end

  it "must represent 49" do
    klass.to_roman(49).must_equal "XLIX"
    klass.to_i("XLIX").must_equal 49
  end

  it "must represent 163" do
    klass.to_roman(163).must_equal "CLXIII"
    klass.to_i("CLXIII").must_equal 163
  end

  it "must represent 402" do
    klass.to_roman(402).must_equal "CDII"
    klass.to_i("CDII").must_equal 402
  end

  it "must represent 911" do
    klass.to_roman(911).must_equal "CMXI"
    klass.to_i("CMXI").must_equal 911
  end

  it "must represent 3000" do
    klass.to_roman(3000).must_equal "MMM"
    klass.to_i("MMM").must_equal 3000
  end
end
