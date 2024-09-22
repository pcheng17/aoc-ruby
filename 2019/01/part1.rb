def getFuel(mass)
  (mass / 3).floor - 2
end

puts File.read("input.txt").split("\n").map(&:to_i).map{ |m| getFuel(m) }.sum

