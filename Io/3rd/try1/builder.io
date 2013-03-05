Builder := Object clone

Builder index := 0

Builder writeln := method(
  (self index - 1) repeat("  " print) 
  writeln(call evalArgs join)
)

Builder forward := method(

  self index := self index + 1
  self writeln("<", call message name, ">")

  call message arguments foreach(arg,
    content := self doMessage(arg);
    if(content type == "Sequence",
      self index := self index + 1
      self writeln(content)
      self index := self index - 1
    )
  )

  self writeln("</", call message name, ">")
  self index := self index - 1

)

Builder ul(
  li("IO"),
  li("Lua"),
  li("JavaScript"))

