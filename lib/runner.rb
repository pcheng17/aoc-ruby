require 'benchmark'

class Runner
  def initialize(year, day, part)
    @year = year
    @day = day
    @part = part
  end

  def solve
    day_str = @day.to_s.rjust(2, '0')  # Format the day as '01', '02', etc.
    input_file = File.expand_path("../#{@year}/inputs/#{day_str}.txt", __dir__)
    solution_file = File.expand_path("../#{@year}/#{day_str}.rb", __dir__)

    if not File.exist?(input_file)
      puts "Input file for year #{@year} day #{@day} not found."
      return
    end
    if not File.exist?(solution_file)
      puts "Solution for year #{@year} day #{@day} not found."
      return
    end

    require_relative solution_file
    @input = File.read(input_file)

    parts = [1, 2].include?(@part) ? [@part] : [1, 2]

    parts.each do |p|
      time = Benchmark.measure { answer = send("part#{p}", @input) }
      answer = send("part#{p}", @input) || "nil"
      puts "🎄 Part #{p}: #{answer} :: #{(time.real * 1000).round(4)} ms"
    end
  end
end
