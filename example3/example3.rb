ACTUAL_TRIANGLES = {true: 0, false: 0}

def calculate_triangles
  new_format = open_file("example3.txt")
  new_format.each do |new_line|
    first_side, second_side, third_side = new_line[2..-1].split(" ") if new_line
    sides = [first_side.to_i, second_side.to_i, third_side.to_i].sort
    if sides[0] + sides[1] > sides[2]
      ACTUAL_TRIANGLES[:true] += 1
    else
      ACTUAL_TRIANGLES[:false] += 1
    end
  end
end

def open_file(file)
  lines = []
  new_format = File.open(file, "r+").each_line do |line|
    lines << line.gsub!("\n", "")
  end
  lines
end


calculate_triangles

p ACTUAL_TRIANGLES[:true]
