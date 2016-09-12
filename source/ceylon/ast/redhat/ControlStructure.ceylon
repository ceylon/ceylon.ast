import ceylon.ast.core {
    ControlStructure,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JControlStatement=ControlStatement,
        JDynamicStatement=DynamicStatement,
        JForStatement=ForStatement,
        JIfStatement=IfStatement,
        JSwitchStatement=SwitchStatement,
        JTryCatchStatement=TryCatchStatement,
        JWhileStatement=WhileStatement
    }
}

"Converts a RedHat AST [[ControlStatement|JControlStatement]] to a `ceylon.ast` [[ControlStructure]]."
shared ControlStructure controlStructureToCeylon(JControlStatement controlStructure, Anything(JNode,Node) update = noop) {
    assert (is JIfStatement|JForStatement|JWhileStatement|JSwitchStatement|JTryCatchStatement|JDynamicStatement controlStructure);
    switch (controlStructure)
    case (is JIfStatement) { return ifElseToCeylon(controlStructure, update); }
    case (is JForStatement) { return forFailToCeylon(controlStructure, update); }
    case (is JWhileStatement) { return whileToCeylon(controlStructure, update); }
    case (is JSwitchStatement) { return switchCaseElseToCeylon(controlStructure, update); }
    case (is JTryCatchStatement) { return tryCatchFinallyToCeylon(controlStructure, update); }
    case (is JDynamicStatement) { return dynamicBlockToCeylon(controlStructure, update); }
}

"Parses the given [[code]] for a Control Structure
 into a [[ControlStructure]] using the Ceylon compiler
 (more specifically, the rule for a `controlStatement`)."
shared ControlStructure? parseControlStructure(String code, Anything(JNode,Node) update = noop) {
    if (exists jControlStatement = createParser(code).controlStatement()) {
        return controlStructureToCeylon(jControlStatement, update);
    } else {
        return null;
    }
}
