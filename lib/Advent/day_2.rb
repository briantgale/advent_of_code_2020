class Advent::Day2

  def run
    input_values.select do |i|
      count = i[:string].scan(i[:letter]).count
      count >= i[:range_start] && count <= i[:range_end]
    end.count
  end

  private

  def input_values
    path = File.join(Dir.pwd, "lib", "advent", "input_files", "input_day_2.txt")
    f = File.open(path)
    f.readlines(chomp: true).map do |line|
      m = line.match(/^(\d+)\-(\d+)\s(\w):\s(\w+)$/)
      {
        range_start: m.captures[0].to_i,
        range_end: m.captures[1].to_i,
        letter: m.captures[2],
        string: m.captures[3]
      }
    end
  end
end
