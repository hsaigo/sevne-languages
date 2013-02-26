Number original_division := Number getSlot("/")
Number / := method(denominator, if(denominator == 0, 0, self original_division(denominator)))

writeln("1 / 2 = ", 1 / 2)
writeln("1 / 0 = ", 1 / 0)
writeln("0 / 0 = ", 0 / 0)
writeln("-1 / 0 = ", -1 / 0)

