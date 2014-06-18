"Workaround for [ceylon/ceylon-compiler#1665](https://github.com/ceylon/ceylon-compiler/issues/1665)"
TypeIsh[] bug1665Workaround2(TypeNameWithArguments nameAndArgs, TypeIsh[] otherChildren) => [nameAndArgs, *otherChildren];
"A simple type: One or more [[TypeNamesWithArguments|TypeNameWithArguments]], separated by member operators.
 
 ~~~
 String
 Iterable<String,Nothing>
 Outer.Inner
 ~~~
 
 The type of every instance can be written as a `SimpleType`."
shared abstract class SimpleType(nameAndArgs, TypeIsh[] otherChildren = [])
        of BaseType|QualifiedType
        extends Type(bug1665Workaround2(nameAndArgs, otherChildren)) { // TODO extends Type([nameAndArgs, *otherChildren]) {
    
    "The type name and arguments."
    shared TypeNameWithArguments nameAndArgs;
}
