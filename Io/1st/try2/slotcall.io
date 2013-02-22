SlotOwner := Object clone
SlotOwner has_a_method := method("Hello" println)

SlotOwner getSlot("has_a_method") call

