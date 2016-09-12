import ceylon.ast.core {
    InterfaceBody,
    Declaration,
    Node,
    Specification
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDeclaration=Declaration,
        JInterfaceBody=InterfaceBody,
        JSpecifierStatement=SpecifierStatement,
        JStatement=Statement
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[InterfaceBody|JInterfaceBody]] to a `ceylon.ast` [[InterfaceBody]]."
shared InterfaceBody interfaceBodyToCeylon(JInterfaceBody interfaceBody, Anything(JNode,Node) update = noop) {
    value result = InterfaceBody(CeylonIterable(interfaceBody.statements).collect {
            Declaration|Specification collecting(JStatement statement) {
                assert (is JDeclaration|JSpecifierStatement statement);
                switch (statement)
                case (is JDeclaration) { return declarationToCeylon(statement, update); }
                case (is JSpecifierStatement) { return specificationToCeylon(statement, update); }
            }
        });
    update(interfaceBody, result);
    return result;
}

"Parses the given [[code]] for an Interface Body
 into an [[InterfaceBody]] using the Ceylon compiler
 (more specifically, the rule for an `interfaceBody`)."
shared InterfaceBody? parseInterfaceBody(String code, Anything(JNode,Node) update = noop) {
    if (exists jInterfaceBody = createParser(code).interfaceBody()) {
        return interfaceBodyToCeylon(jInterfaceBody, update);
    } else {
        return null;
    }
}
