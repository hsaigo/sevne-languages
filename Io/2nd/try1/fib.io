fib := method(x, if(x == 1 or x == 2, 1, (fib(x - 1) + fib(x - 2))))

for(i, 1, 30, writeln("fib(", i, ")=", fib(i)))
