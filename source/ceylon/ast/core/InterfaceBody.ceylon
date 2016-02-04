"""A list of declarations, surrounded by braces.
   
   Unlike class bodies, interface bodies can’t immediately contain runnable code,
   so the [[content]] is just declarations, no statements.
   An exception from this are specifications, which, while technically statements,
   are allowed (shortcut refinement).
   
   Examples (multi-line):
   
       {
           shared formal Other plus(Other other);
       }
       {
           shared default void writeString(String string) => print(string);
           shared default void write(Anything that) => writeString(that?.string else "<null>");
       }
       {
           shared formal String name;
           string => name;
       }"""
shared class InterfaceBody(content)
        extends Body() {
    
    shared actual <Declaration|Specification>[] content;
    
    shared actual <Declaration|Specification>[] children = content;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformInterfaceBody(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitInterfaceBody(this);

    shared actual Boolean equals(Object that) {
        if (is InterfaceBody that) {
            return content == that.content;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * content.hash;
    
    shared InterfaceBody copy(<Declaration|Specification>[] content = this.content) {
        value ret = InterfaceBody(content);
        copyExtraInfoTo(ret);
        return ret;
    }
}
