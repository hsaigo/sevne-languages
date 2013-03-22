
Attributes := Map clone do (
  atPutAttribute := method(
    self atPut(
      call evalArgAt(0) asMutable removePrefix("\"") removeSuffix("\""), 
      call evalArgAt(1))
  )

  asString := method(
    list := List clone
    self foreach(k, v, list append(" #{k}=\"#{v}\"" interpolate))
    list join
  )
)

OperatorTable addAssignOperator(":", "atPutAttribute")
Object curlyBrackets := method(
  r := Attributes clone
  call message arguments foreach(arg,
    r doString(arg asString)
  )
  r
)

Builder := Object clone do (

  index := 0

  writeln := method(
    index repeat("  " print) 
    writeln(call evalArgs join)
  )

  forward := method(

    attributes := doMessage(call argAt(0))
    self writeln("<", call message name, 
      if(attributes type == "Attributes", attributes asString, ""), ">")

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
)

Builder book({"author" : "Tate", "date" : "2012/01/02"},
  title({"language":"Japanes"},"AAA"),
  title("bbb", format({"with":"100", "heigh":"50"}))
)

