"""A list of statements and declarations, surrounded by braces.
   
   Logically, a class body is divided into two sections:
   * An initializer section, mixing statements and declarations, and
   * a declaration section, containing only declarations.
   
   There is, however, no syntactical separation between these,
   so syntactically a class body looks exactly like a [[Block]].
   
   A class body may also include a list of [[imports]]
   that is local to this class body only.
   
   Examples (multi-line):
   
       {
           shared formal Float x;
           shared formal Float y;
           shared actual default Float distance(Point other) => ((x-other.x)^2 + (y-other.y)^2)^0.5;
       }
   
       {
           if (token != secret) {
               throw AssertionError("You may not instantiate this class!");
           }
           shared void hack(Anything victim) {
               ████ ███████ ██ █;
           }
       }"""
shared class ClassBody(content, imports = [])
        extends Body() {
    
    shared actual Import[] imports;
    shared actual <Declaration|Statement>[] content;
    
    shared actual <Import|Declaration|Statement>[] children = concatenate(imports, content);
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformClassBody(this);
    
    shared actual void visit(Visitor visitor)
            => visitor.visitClassBody(this);

    shared actual Boolean equals(Object that) {
        if (is ClassBody that) {
            return imports == that.imports && content == that.content;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * (imports.hash + 31 * content.hash);
    
    shared ClassBody copy(<Declaration|Statement>[] content = this.content, Import[] imports = this.imports) {
        value ret = ClassBody(content, imports);
        copyExtraInfoTo(ret);
        return ret;
    }
}
