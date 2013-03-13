
OperatorTable addAssignOperator(":", "atPutAttribute")

Map atPutAttribute := method(
  self atPut(
    call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""), 
    call evalArgAt(1))
)

Object curlyBrackets := method(
  r := Map clone
  call message arguments foreach(arg,
    r doString(arg asString)
  )
  r
)

m := { "foo" : 1, "bar" : 2, "baz" : 3 }

m asJson println
