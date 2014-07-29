import ceylon.ast.core {
    Declaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDeclaration=Declaration
    }
}

"Converts a RedHat AST [[Declaration|JDeclaration]] to a `ceylon.ast` [[Declaration]]."
shared Declaration declarationToCeylon(JDeclaration declaration) {
    // TODO switch on case types, call appropriate subtypeToCeylon(declaration) function
    throw AssertionError("Not yet implemented!");
}

"Compiles the given [[code]] for a Declaration
 into a [[Declaration]] using the Ceylon compiler
 (more specifically, the rule for a `declaration`)."
shared Declaration? compileDeclaration(String code) {
    if (exists jDeclaration = createParser(code).declaration()) {
        return declarationToCeylon(jDeclaration);
    } else {
        return null;
    }
}
