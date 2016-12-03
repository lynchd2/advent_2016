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


#calculate_triangles



# Second half

def calculate_triangles2
  three_triangles = [[], [], []]
  new_format = open_file("example3.txt")
  new_format.each do |new_line|
    first_side = new_line[2..-1].split(" ") if new_line
    three_triangles[0] << first_side[0].to_i if new_line
    three_triangles[1] << first_side[1].to_i if new_line
    three_triangles[2] << first_side[2].to_i if new_line
    if three_triangles[0].length == 3
      three_triangles.each do |triangle|
        sorted_triangle = triangle.sort
        if sorted_triangle[0] + sorted_triangle[1] > sorted_triangle[2]
          ACTUAL_TRIANGLES[:true] += 1
        else
          ACTUAL_TRIANGLES[:false] += 1
        end
      end
      three_triangles = [[], [], []]
    end
  end
end

calculate_triangles2


#Does not get the last side for the last three triangles. Added 3 because they are triangles if side was added.
p ACTUAL_TRIANGLES[:true] + 3
