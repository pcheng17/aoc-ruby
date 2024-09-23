require "httparty"

class Starter
  def initialize(year, day)
    @headers = nil
    @year = year
    @day = day
  end

  def headers
    @headers ||= { "Cookie" => ENV.fetch("COOKIE") { File.read(".session") }}
  end

  def get_input
    response = HTTParty.get("https://adventofcode.com/#{@year}/day/#{@day}/input", headers: headers)
    return response.body
  rescue => e
    puts "Error: #{e}"
  end

  def execute
    day_str = @day.to_s.rjust(2, '0')
    input_file = File.expand_path("../#{@year}/inputs/#{day_str}.txt", __dir__)
    File.open(input_file, "w") do |file|
      file.write(get_input())
    end

    scaffold_file = File.expand_path("../#{@year}/#{day_str}.rb", __dir__)
    File.open(scaffold_file, "w") do |file|
      file.write("def part1(input)\n  nil\nend\n\n")
      file.write("def part2(input)\n  nil\nend\n")
    end unless File.exist?(scaffold_file)
  end
end

s = Starter.new(2019, 5)
s.execute
