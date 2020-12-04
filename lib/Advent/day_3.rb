class Advent::Day3
  
  def run
    [
      hits_for_path(1, 1),
      hits_for_path(3, 1),
      hits_for_path(5, 1),
      hits_for_path(7, 1),
      hits_for_path(1, 2)
    ].reduce(&:*)
  end

  private

  def hits_for_path(move_right, move_down)
    arr = prepare_array(move_down)
    vals = arr.map.with_index { |r, i| character_for_row(r, i, move_right) }
    vals.select { |v| v == "#" }.count
  end

  def character_for_row(data, row_num, x_mult)
    target_i = row_num * x_mult
    data = data * ((target_i / data.length) + 1)
    data[target_i]
  end

  def prepare_array(y_mult)
    return input_values if y_mult == 1

    c = 1
    a = input_values.map do |r|
      if c == y_mult
        c = 1
        next
      else
        c += 1
        r
      end
    end

    a.compact
  end

  def input_values
    path = File.join(Dir.pwd, "lib", "advent", "input_files", "input_day_3.txt")
    f = File.open(path)
    f.readlines(chomp: true)
  end

end
