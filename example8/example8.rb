X_BOUNDARY = 50
Y_BOUNDARY = 6
@count = 0
def create_grid
	grid = Array.new(6) {[]}
	grid.each do |row|
		50.times { row << "."}
	end
	grid
end

GRID = create_grid

def print_grid
	GRID.each do |row|
		p row
	end
end

def display_grid

end

def delegate_tasks
	tasks = open_file("example8.txt")
	tasks.each do |task|
		if task.split(" ")[0] == "rect"
			rect_task(task)
		else
			rotate_task(task)
		end
	end
end

def rotate_task(task)
	if task.split(" ")[1] == "column"
		column_rotate(task)
	else
		row_rotate(task)
	end
end

def rect_task(task)
	columns, rows = task.split(" ")[1].split("x")
	0.upto(rows.to_i - 1) do |row|
		0.upto(columns.to_i - 1) do |column|
			p GRID[row][column] if GRID[row][column] == "#"
			GRID[row][column] = "#"
			@count += 1
		end
	end
end

def column_rotate(task)
	column = task.split(" ")[2].split("=")[-1]
	amount_to_rotate = task.split(" ")[-1]
	lights_on = []
	row_count = 0
	GRID.each do |row|
		if row[column.to_i] == "#"
			lights_on << row_count + amount_to_rotate.to_i
			GRID[row_count][column.to_i] = "."
		end
		row_count += 1
	end
	lights_on.each do |light_row|
	 	until light_row < Y_BOUNDARY
	 		light_row -= Y_BOUNDARY
		end
		GRID[light_row][column.to_i] = "#"
	end
end

def row_rotate(task)
	row = task.split(" ")[2].split("=")[-1].to_i
	amount_to_rotate = task.split(" ")[-1].to_i

	lights_on = []
	column_count = 0
	GRID[row].each do |pixel|
		if pixel == "#"
			GRID[row][column_count] = "."
			lights_on << column_count + amount_to_rotate
		end
		column_count += 1
	end
	lights_on.each do |light|
		until light < X_BOUNDARY
	 		light -= X_BOUNDARY
		end
		GRID[row][light] = "#"
	end
end


def open_file(file)
	lines = []
	File.open(file, "r").each_line do |line|
		lines << line.gsub("\n", "")
	end
	lines
end

def count_lights
	count = 0
	GRID.each do |row|
		row.each do |pixel|
			if pixel == "#"
				count += 1
			end
		end
	end
	p count
end


delegate_tasks
count_lights
print_grid
