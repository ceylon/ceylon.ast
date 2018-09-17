import ceylon.ast.core {
    Node,
    Type
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JEntryType=EntryType,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[StaticType|JStaticType]] to a `ceylon.ast` [[Type]]."
shared Type typeToCeylon(JStaticType type, Anything(JNode, Node) update = noop) {
    if (is JEntryType type) {
        return entryTypeToCeylon(type, update);
    } else {
        return mainTypeToCeylon(type, update);
    }
}

"Parses the given [[code]] for a Type
 into a [[Type]] using the Ceylon compiler
 (more specifically, the rule for a `type`)."
shared Type? parseType(String code, Anything(JNode, Node) update = noop) {
    if (exists jType = createParser(code + ",").type()) {
        // the parser needs that comma for grouped types (eclipse/ceylon#7413)
        return typeToCeylon(jType, update);
    } else {
        return null;
    }
}
