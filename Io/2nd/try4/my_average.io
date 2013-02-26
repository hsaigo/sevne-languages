List myAverage := method(
	total := 0
	self foreach(element,
		if (element type != "Number", Exception raise("#{element} is not a Number." interpolate))
		total = total + element)
	total / self size)

writeln("average = ", list( 1, 2, 3, 4) myAverage)
writeln("average = ", list( 1, "aaa", 3, 4) myAverage)
