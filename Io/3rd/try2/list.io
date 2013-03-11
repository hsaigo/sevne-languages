Object squareBrackets := method(
  r := List clone
  call message arguments foreach(arg, r push(doMessage(arg)))
  r
)
List squareBrackets := method(
  self at(call evalArgAt(0)))

list := [1, 2, 3, 4]

list[0] println
list[1] println
list[2] println
list[3] println

list println

