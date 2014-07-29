import ceylon.ast.core {
    InterfaceBody,
    Declaration
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDeclaration=Declaration,
        JInterfaceBody=InterfaceBody,
        JStatement=Statement
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[InterfaceBody|JInterfaceBody]] to a `ceylon.ast` [[InterfaceBody]]."
shared InterfaceBody interfaceBodyToCeylon(JInterfaceBody interfaceBody) {
    return InterfaceBody(CeylonIterable(interfaceBody.statements).collect {
            Declaration collecting(JStatement statement) {
                assert (is JDeclaration statement);
                return declarationToCeylon(statement);
            }
        });
}

"Compiles the given [[code]] for an Interface Body
 into an [[InterfaceBody]] using the Ceylon compiler
 (more specifically, the rule for an `interfaceBody`)."
shared InterfaceBody? compileInterfaceBody(String code) {
    if (exists jInterfaceBody = createParser(code).interfaceBody()) {
        return interfaceBodyToCeylon(jInterfaceBody);
    } else {
        return null;
    }
}
