import ceylon.ast.core {
    Node,
    SpreadType
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JSpreadType=SpreadType,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[SpreadType|JSpreadType]] to a `ceylon.ast` [[SpreadType]]."
shared SpreadType spreadTypeToCeylon(JSpreadType spreadType, Anything(JNode, Node) update = noop) {
    "Must be an actual type"
    assert (is JStaticType jType = spreadType.type);
    value result = SpreadType(typeToCeylon(jType, update));
    update(spreadType, result);
    return result;
}

"Parses the given [[code]] for a Spread Type
 into a [[SpreadType]] using the Ceylon compiler
 (more specifically, the rule for a `spreadType`)."
shared SpreadType? parseSpreadType(String code, Anything(JNode, Node) update = noop) {
    if (exists jSpreadType = createParser(code).spreadType()) {
        assert (is JSpreadType jSpreadType);
        return spreadTypeToCeylon(jSpreadType, update);
    } else {
        return null;
    }
}
