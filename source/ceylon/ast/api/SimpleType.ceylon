"Workaround for [ceylon/ceylon-compiler#1665](https://github.com/ceylon/ceylon-compiler/issues/1665)"
<Type|TypeNameWithArguments>[] bug1665Workaround2(TypeNameWithArguments nameAndArgs, <Type|TypeNameWithArguments>[] otherChildren) => [nameAndArgs, *otherChildren];
shared abstract class SimpleType(nameAndArgs, <Type|TypeNameWithArguments>[] otherChildren = [])
        of BaseType|QualifiedType
        extends Type(bug1665Workaround2(nameAndArgs, otherChildren)) { // TODO extends Type([nameAndArgs, *otherChildren]) {
    
    "The type name and arguments."
    shared TypeNameWithArguments nameAndArgs;
}
