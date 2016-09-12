import ceylon.ast.core {
    ExtendedType,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JExtendedType=ExtendedType
    }
}

"Converts a RedHat AST [[ExtendedType|JExtendedType]] to a `ceylon.ast` [[ExtendedType]]."
shared ExtendedType extendedTypeToCeylon(JExtendedType extendedType, Anything(JNode,Node) update = noop) {
    value result = ExtendedType(extensionOrConstructionToCeylon(extendedType.invocationExpression else extendedType.type, update));
    update(extendedType, result);
    return result;
}

"Parses the given [[code]] for an Extended Type
 into an [[ExtendedType]] using the Ceylon compiler
 (more specifically, the rule for an `extendedType`)."
shared ExtendedType? parseExtendedType(String code, Anything(JNode,Node) update = noop) {
    if (exists jExtendedType = createParser(code).extendedType()) {
        return extendedTypeToCeylon(jExtendedType, update);
    } else {
        return null;
    }
}
