import ceylon.ast.core {
    GroupedType,
    Node
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JGroupedType=GroupedType
    }
}

"Converts a RedHat AST [[GroupedType|JGroupedType]] to a `ceylon.ast` [[GroupedType]]."
shared GroupedType groupedTypeToCeylon(JGroupedType groupedType, Anything(JNode,Node) update = noop) {
    value result = GroupedType(typeToCeylon(groupedType.type, update));
    update(groupedType, result);
    return result;
}

"Parses the given [[code]] for a Grouped Type
 into a [[GroupedType]] using the Ceylon compiler
 (more specifically, the rule for a `groupedType`)."
shared GroupedType? parseGroupedType(String code, Anything(JNode,Node) update = noop) {
    if (exists jGroupedType = createParser(code).groupedType()) {
        return groupedTypeToCeylon(jGroupedType, update);
    } else {
        return null;
    }
}
