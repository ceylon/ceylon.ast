"A tuple type, which may be either [[list-based|ListTupleType]] (commonly just called a “tuple type”) or [[length-based|LengthTupleType]].
 
 Examples:
 
     [String,Integer,Integer]
     Boolean[8]"
shared abstract class TupleType()
        of ListTupleType | LengthTupleType
        extends PrimaryType() {
}
