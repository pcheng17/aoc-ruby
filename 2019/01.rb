def part1(input)
  input.split("\n").map{ |m| m.to_i / 3 - 1 }.sum
end

def part2(input)
  def getFuel(mass)
    mass / 3 - 2
  end

  data = input.split("\n").map(&:to_i)

  part2 = 0
  for mass in data
    fuel = getFuel(mass)
    while fuel > 0
      part2 += fuel
      fuel = getFuel(fuel)
    end
  end

  part2
end
