"The root node of a Ceylon AST.
 A *compilation unit* is a text file with the filename extension `.ceylon`.
 
 TODO the three types of compilation units"
shared class CompilationUnit() extends Node([]) {
    // TODO implement
    
    shared actual void visit(Visitor visitor) => visitor.visitCompilationUnit(this);
    
    toCeylonExpression() => "CompilationUnit()";
    
    shared actual Boolean equals(Object other) {
        if (is CompilationUnit other) {
            return children == other.children;
        } else {
            return false;
        }
    }
    
    shared actual Integer hash => children.hash;
}
