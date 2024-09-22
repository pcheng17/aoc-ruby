data = File.read("input.txt").split(",").map(&:to_i)

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

puts data[0]

