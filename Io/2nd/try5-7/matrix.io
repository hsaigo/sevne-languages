Matrix := List clone do (
	dim := method(size_x, size_y, 
		self setSize(size_x)
		for(i, 0, size_x - 1, self atPut(i, List clone setSize(size_y))))
	set := method(x, y, value, self at(x) atPut(y, value))
	get := method(x, y, self at(x) at(y))
	x_y := method(r := Matrix clone
		r dim(self at(0) size, self size)
		for(x, 0, self size - 1,
			for(y, 0, self at(0) size - 1, r set(y, x, self get(x, y))))
		r )
	write := method(path, f := File with(path) openForUpdating;
		self foreach(row, 
			row foreach(col, f write(" #{col}" interpolate))
			 f write("\n")))
	read := method(path, data := File with(path) openForReading contents;
		self empty
		data println)
		
)


matrix := Matrix clone

matrix dim(3,4)
matrix set(0, 0, "aaa")
matrix set(1, 2, "bbb")
matrix set(2, 3, "ccc")

for(i, 0, matrix size -1, matrix at(i) println)

matrix get(0, 0) println
matrix get(1, 2) println
matrix get(2, 3) println

new_matrix := matrix x_y
(matrix get(0, 0) == new_matrix get(0, 0)) println
(matrix get(1, 2) == new_matrix get(2, 1)) println
(matrix get(2, 3) == new_matrix get(3, 2)) println

for(i, 0, new_matrix size -1, new_matrix at(i) println)

matrix write("write.txt")

