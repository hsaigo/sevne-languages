fib := method(x, if(x == 1 or x == 2, 1, 
	left := 1; right := 1; 
	for(i, 3, x, result := left + right; left := right; right := result)
	)
)

for(i, 1, 30, writeln("fib(", i, ")=", fib(i)))
