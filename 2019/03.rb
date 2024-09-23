def get_points(line)
  points = []
  x = 0
  y = 0
  line.each do |instruction|
    direction = instruction[0]
    distance = instruction[1..].to_i
    case direction
    when "U"
      distance.times do
        y += 1
        points << [x, y]
      end
    when "D"
      distance.times do
        y -= 1
        points << [x, y]
      end
    when "L"
      distance.times do
        x -= 1
        points << [x, y]
      end
    when "R"
      distance.times do
        x += 1
        points << [x, y]
      end
    end
  end
  points
end

def part1(input)
  line_directions = input.split("\n")
  first_line_points = get_points(line_directions[0].split(","))
  second_line_points = get_points(line_directions[1].split(","))
  intersections = (first_line_points & second_line_points).reject { |x, y| x == 0 && y == 0 }
  intersections.map { |x, y| x.abs + y.abs }.min
end

def part2(input)
  line_directions = input.split("\n")
  first_line_points = get_points(line_directions[0].split(","))
  second_line_points = get_points(line_directions[1].split(","))
  intersections = (first_line_points & second_line_points).reject { |x, y| x == 0 && y == 0 }

  min_steps = 1.0 / 0
  for pos in intersections
    # Must +2 because the index is 0-based. If `pos` is the first element, then we've taken 1 step.
    steps = first_line_points.index(pos) + second_line_points.index(pos) + 2
    min_steps = steps if steps < min_steps
  end

  min_steps
end
