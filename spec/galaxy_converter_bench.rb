require "helper"

input = Stubs::NOTES

Benchmark.ips do |x|
  x.report("::call") do
    GalaxyConverter::call(input)
  end
end
