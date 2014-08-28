import ceylon.ast.core {
    ControlStructure
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JControlStatement=ControlStatement,
        JForStatement=ForStatement,
        JIfStatement=IfStatement,
        JWhileStatement=WhileStatement
    }
}

"Converts a RedHat AST [[ControlStatement|JControlStatement]] to a `ceylon.ast` [[ControlStructure]]."
shared ControlStructure controlStructureToCeylon(JControlStatement controlStructure) {
    assert (is JIfStatement|JForStatement|JWhileStatement controlStructure);
    switch (controlStructure)
    case (is JIfStatement) { return ifElseToCeylon(controlStructure); }
    case (is JForStatement) { return forFailToCeylon(controlStructure); }
    case (is JWhileStatement) { return whileToCeylon(controlStructure); }
}

"Compiles the given [[code]] for a Control Structure
 into a [[ControlStructure]] using the Ceylon compiler
 (more specifically, the rule for a `controlStatement`)."
shared ControlStructure? compileControlStructure(String code) {
    if (exists jControlStatement = createParser(code).controlStatement()) {
        return controlStructureToCeylon(jControlStatement);
    } else {
        return null;
    }
}
