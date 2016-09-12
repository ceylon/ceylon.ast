import ceylon.ast.core {
    ClassBody,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JClassBody=ClassBody
    },
    CustomTree {
      JGuardedVariable=GuardedVariable
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ClassBody|JClassBody]] to a `ceylon.ast` [[ClassBody]]."
shared ClassBody classBodyToCeylon(JClassBody classBody, Anything(JNode,Node) update = noop) {
    value result = ClassBody(CeylonIterable(classBody.statements).filter((d) => !d is JGuardedVariable).collect(propagateUpdate(declarationOrStatementToCeylon, update)));
    update(classBody, result);
    return result;
}

"Parses the given [[code]] for a Class Body
 into a [[ClassBody]] using the Ceylon compiler
 (more specifically, the rule for a `classBody`)."
shared ClassBody? parseClassBody(String code, Anything(JNode,Node) update = noop) {
    if (exists jClassBody = createParser(code).classBody()) {
        return classBodyToCeylon(jClassBody, update);
    } else {
        return null;
    }
}
