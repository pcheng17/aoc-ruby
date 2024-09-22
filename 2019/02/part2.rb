def run_program(data)
  i = 0
  while i < data.length
    if data[i] == 99
      break
    elsif data[i] == 1
      data[data[i + 3]] = data[data[i + 1]] + data[data[i + 2]]
    elsif data[i] == 2
      data[data[i + 3]] = data[data[i + 1]] * data[data[i + 2]]
    end
    i += 4
  end
  data[0]
end

data = File.read("input.txt").split(",").map(&:to_i)

for noun in 0..99
  for verb in 0..99
    data_copy = data.dup
    data_copy[1] = noun
    data_copy[2] = verb
    if run_program(data_copy) == 19690720
      puts 100 * noun + verb
      break
    end
  end
end
