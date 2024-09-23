def run_intcode(code)
  i = 0
  while i < code.length
    if code[i] == 99
      break
    elsif code[i] == 1
      code[code[i + 3]] = code[code[i + 1]] + code[code[i + 2]]
    elsif code[i] == 2
      code[code[i + 3]] = code[code[i + 1]] * code[code[i + 2]]
    end
    i += 4
  end
  code[0]
end

def part1(input)
  data = input.split(",").map(&:to_i)
  run_intcode(data)
  data[0]
end

def part2(input)
  data = input.split(",").map(&:to_i)
  for noun in 0..99
    for verb in 0..99
      data_copy = data.dup
      data_copy[1] = noun
      data_copy[2] = verb
      run_intcode(data_copy)
      if data_copy[0] == 19690720
        return 100 * noun + verb
      end
    end
  end
end
