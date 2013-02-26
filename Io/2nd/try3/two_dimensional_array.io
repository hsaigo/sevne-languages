target := list(
	list( 1, 2, 3, 4),
	list( 2, 3, 4, 5),
	list( 3, 4, 5, 6))
total := 0
target foreach(array, array foreach(element, total = total + element))
writeln("total =>" total)

