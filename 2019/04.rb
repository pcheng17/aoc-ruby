def part1(input)
  range = input.split("-").map(&:to_i)
  answer = 0
  range[0].upto(range[1]).count do |x|
    x = x.to_s
    next if x != x.chars.sort.join
    answer += 1 if x.chars.chunk(&:itself).map { |_, c| c.size }.any? { |n| n >= 2 }
  end
  answer
end

def part2(input)
  range = input.split("-").map(&:to_i)
  answer = 0
  range[0].upto(range[1]).count do |x|
    x = x.to_s
    next if x != x.chars.sort.join
    answer += 1 if x.chars.chunk(&:itself).map {|_, c| c.size}.any? { |n| n == 2 }
  end
  answer
end
