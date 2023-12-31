// Import StuctContract
import StructContract from 0x07

pub fun main(id: UInt64): StructContract.Student? {
  return StructContract.getStudent(id: id)!
}
