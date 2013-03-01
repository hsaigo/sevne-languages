Numbers := Object clone do (
	answer := nil
	before := nil
)

Numbers play := method(
	self answer := Random value(100) round
	self before := nil
	"数を当ててね" println; answer println
	count := 0
	while(number := File standardInput readLine,
		count := count + 1; if(count >= 10, break)
		if(self challenge(number asNumber), return))
	"残念でした。" println;
)

Numbers challenge := method(number, 
	if(answer == number, "正解です" println ; return true)
	hint := "違います"
	if(before,
		if((before - answer) abs > (number - answer) abs, hint := "近づきました")
		if((before - answer) abs < (number - answer) abs, hint := "遠くなりました"))
	hint println
	self before := number
	return false
)

Numbers play

