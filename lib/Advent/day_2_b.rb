class Advent::Day2B

  def run
    input_values.select do |i|
      letters = [i[:string][i[:index_1]], i[:string][i[:index_2]]]
      letters.reject! { |l| l != i[:letter] }
      letters.count == 1
    end.count
  end

  private

  def input_values
    path = File.join(Dir.pwd, "lib", "advent", "input_files", "input_day_2.txt")
    f = File.open(path)
    f.readlines(chomp: true).map do |line|
      m = line.match(/^(\d+)\-(\d+)\s(\w):\s(\w+)$/)
      {
        index_1: m.captures[0].to_i - 1,
        index_2: m.captures[1].to_i - 1,
        letter: m.captures[2],
        string: m.captures[3]
      }
    end
  end
end
