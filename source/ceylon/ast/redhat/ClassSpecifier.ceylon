import ceylon.ast.core {
    ClassSpecifier,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JClassSpecifier=ClassSpecifier
    }
}

"Converts a RedHat AST [[ClassSpecifier|JClassSpecifier]] to a `ceylon.ast` [[ClassSpecifier]]."
shared ClassSpecifier classSpecifierToCeylon(JClassSpecifier classSpecifier, Anything(JNode,Node) update = noop) {
    value result = ClassSpecifier(extensionOrConstructionToCeylon(classSpecifier.invocationExpression else classSpecifier.type, update));
    update(classSpecifier, result);
    return result;
}

"Compiles the given [[code]] for a Class Specifier
 into a [[ClassSpecifier]] using the Ceylon compiler
 (more specifically, the rule for a `classSpecifier`)."
shared ClassSpecifier? compileClassSpecifier(String code, Anything(JNode,Node) update = noop) {
    if (exists jClassSpecifier = createParser(code).classSpecifier()) {
        return classSpecifierToCeylon(jClassSpecifier, update);
    } else {
        return null;
    }
}
