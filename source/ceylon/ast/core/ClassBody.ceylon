"""A list of statements and declarations, surrounded by braces.
   
   Logically, a class body is divided into two sections:
   * An initializer section, mixing statements and declarations, and
   * a declaration section, containing only declarations.
   
   There is, however, no syntactical separation between these,
   so syntactically a class body looks exactly like a [[Block]].
   
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
shared class ClassBody(content)
        extends Body() {
    
    shared actual <Declaration|Statement>[] content;
    
    shared actual <Declaration|Statement>[] children = content;
    
    shared actual Result transform<out Result>(Transformer<Result> transformer)
            => transformer.transformClassBody(this);
    
    shared actual Boolean equals(Object that) {
        if (is ClassBody that) {
            return content == that.content;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash
            => 31 * content.hash;
    
    shared ClassBody copy(<Declaration|Statement>[] content = this.content) {
        value ret = ClassBody(content);
        copyExtraInfoTo(ret);
        return ret;
    }
}
