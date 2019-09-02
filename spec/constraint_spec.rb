require "helper"

describe GalaxyConverter::Constraint do
  it "must detect empty value" do
    GalaxyConverter::Constraint.call("").must_be_nil
  end

  it "must detect too many repetition" do
    %w[IIII XXXX CCCC MMMM].each do |value|
      GalaxyConverter::Constraint.call(value).must_equal true
    end
  end

  it "must detect unrepeatable chars" do
    %w[DD LL VV DDD LLL VVV].each do |value|
      GalaxyConverter::Constraint.call(value).must_equal true
    end
  end

  it "must approve valid repetition" do
    %w[III XXX CCC MMM].each do |value|
      GalaxyConverter::Constraint.call(value).must_equal false
    end
  end

  it "must detect repeated subtraction" do
    %w[IIV IIX XXL XXC CCD CCM].each do |value|
      GalaxyConverter::Constraint.call(value).must_equal true
    end
  end

  it "must detect wrong subtraction" do
    %w[IL IC ID IM XD XM VX VL VC VD VM LC LD LM DM].each do |value|
      GalaxyConverter::Constraint.call(value).must_equal true
    end
  end

  it "must approve valid subtraction" do
    %w[IV IX XL XC CD CM].each do |value|
      GalaxyConverter::Constraint.call(value).must_equal false
    end
  end
end
