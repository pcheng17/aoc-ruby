def getFuel(mass)
  (mass / 3).floor - 2
end

data = File.read("input.txt").split("\n").map(&:to_i)

part2 = 0
for mass in data
  fuel = getFuel(mass)
  while fuel > 0
    part2 += fuel
    fuel = getFuel(fuel)
  end
end

puts part2
