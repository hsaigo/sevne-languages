TwoDimensionsList := List clone do (
	dim := method(size_x, size_y, 
		self setSize(size_x)
		for(i, 0, size_x - 1, self atPut(i, List clone setSize(size_y))))
	set := method(x, y, value, self at(x) atPut(y, value))
	get := method(x, y, self at(x) at(y))
)


two_dim_list := TwoDimensionsList clone

two_dim_list dim(3,4)
two_dim_list set(0, 0, "aaa")
two_dim_list set(1, 2, "bbb")
two_dim_list set(2, 3, "ccc")

two_dim_list at(0) println
two_dim_list at(1) println
two_dim_list at(2) println

two_dim_list get(0, 0) println
two_dim_list get(1, 2) println
two_dim_list get(2, 3) println
