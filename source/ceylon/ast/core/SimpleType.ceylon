"A simple type: One or more [[TypeNamesWithArguments|TypeNameWithArguments]], separated by member operators.
 
 ~~~
 String
 Iterable<String,Nothing>
 Outer.Inner
 ~~~
 
 The type of every instance can be written as a `SimpleType`."
shared abstract class SimpleType(nameAndArgs, TypeIsh[] otherChildren = [])
        of BaseType | QualifiedType
        extends PrimaryType([nameAndArgs, *otherChildren]) {
    
    "The type name and arguments."
    shared TypeNameWithArguments nameAndArgs;
}
