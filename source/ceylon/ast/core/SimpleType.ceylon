"A simple type: One or more [[TypeNamesWithArguments|TypeNameWithTypeArguments]], separated by member operators.
 
 ~~~
 String
 Iterable<String,Nothing>
 Outer.Inner
 ~~~
 
 The type of every instance can be written as a `SimpleType`."
shared abstract class SimpleType()
        of BaseType | QualifiedType
        extends PrimaryType() {
    
    "The type name and arguments."
    shared formal TypeNameWithTypeArguments nameAndArgs;
}
