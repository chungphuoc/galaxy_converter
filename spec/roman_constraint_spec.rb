require "helper"

describe GalaxyConverter::Roman::Constraint do
  it "must detect repetition violations" do
    %w[IIIII XXXXXX CCCC MMMMM DD LL VVV].each do |roman|
      GalaxyConverter::Roman::Constraint.new(roman).violated?.must_equal true
    end
  end

  it "must approve valid repetition" do
    %w[III XXX CCC MMM DI LV VIII].each do |roman|
      GalaxyConverter::Roman::Constraint.new(roman).violated?.must_equal false
    end
  end

  it "must detect subtraction violations" do
    %w[IIV IIX XXL XXC CCD CCM IL IC ID IM XD XM VX VL VC VD VM LC LD LM DM].each do |roman|
      GalaxyConverter::Roman::Constraint.new(roman).violated?.must_equal true
    end
  end

  it "must approve valid subtraction" do
    %w[IV IX XL XC CD CM].each do |roman|
      GalaxyConverter::Roman::Constraint.new(roman).violated?.must_equal false
    end
  end
end
