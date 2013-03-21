Builder := Object clone

Builder index := 0

Builder writeln := method(
  index repeat("  " print) 
  writeln(call evalArgs join)
)

Builder forward := method(

  self writeln("<", call message name, ">")
  self index = self index + 1

  call message arguments foreach(arg,
    content := self doMessage(arg);
    if(content type == "Sequence",
      self writeln(content)
    )
  )

  self index = self index - 1
  self writeln("</", call message name, ">")

)

Builder ul(
  li("IO"),
  li("Lua"),
  li("JavaScript"))

