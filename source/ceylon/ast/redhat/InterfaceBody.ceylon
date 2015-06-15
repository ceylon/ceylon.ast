import ceylon.ast.core {
    InterfaceBody,
    Declaration,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
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
shared InterfaceBody interfaceBodyToCeylon(JInterfaceBody interfaceBody, Anything(JNode,Node) update = noop) {
    value result = InterfaceBody(CeylonIterable(interfaceBody.statements).collect {
            Declaration collecting(JStatement statement) {
                assert (is JDeclaration statement);
                return declarationToCeylon(statement, update);
            }
        });
    update(interfaceBody, result);
    return result;
}

"Compiles the given [[code]] for an Interface Body
 into an [[InterfaceBody]] using the Ceylon compiler
 (more specifically, the rule for an `interfaceBody`)."
shared InterfaceBody? compileInterfaceBody(String code, Anything(JNode,Node) update = noop) {
    if (exists jInterfaceBody = createParser(code).interfaceBody()) {
        return interfaceBodyToCeylon(jInterfaceBody, update);
    } else {
        return null;
    }
}
