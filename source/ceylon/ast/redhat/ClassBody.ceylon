import ceylon.ast.core {
    ClassBody
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JClassBody=ClassBody
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ClassBody|JClassBody]] to a `ceylon.ast` [[ClassBody]]."
shared ClassBody classBodyToCeylon(JClassBody classBody) {
    return ClassBody(CeylonIterable(classBody.statements).collect(declarationOrStatementToCeylon));
}

"Compiles the given [[code]] for a Class Body
 into a [[ClassBody]] using the Ceylon compiler
 (more specifically, the rule for a `classBody`)."
shared ClassBody? compileClassBody(String code) {
    if (exists jClassBody = createParser(code).classBody()) {
        return classBodyToCeylon(jClassBody);
    } else {
        return null;
    }
}
