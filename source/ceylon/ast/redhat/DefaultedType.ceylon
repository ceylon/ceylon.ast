import ceylon.ast.core {
    DefaultedType,
    Node
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JDefaultedType=DefaultedType,
        JStaticType=StaticType
    }
}

"Converts a RedHat AST [[DefaultedType|JDefaultedType]] to a `ceylon.ast` [[DefaultedType]]."
shared DefaultedType defaultedTypeToCeylon(JDefaultedType defaultedType, Anything(JNode, Node) update = noop) {
    assert (is JStaticType jType = defaultedType.type);
    value result = DefaultedType(typeToCeylon(jType, update));
    update(defaultedType, result);
    return result;
}

"Parses the given [[code]] for a Defaulted Type
 into a [[DefaultedType]] using the Ceylon compiler
 (more specifically, the rule for a `defaultedType`).
 
 Take care:
 
     Iterable<String>=
 
 is lexed as
 
     Iterable, <, String, >=
 
 which can’t be parsed. Use
 
     Iterable<String> =
 
 instead, if necessary."
shared DefaultedType? parseDefaultedType(String code, Anything(JNode, Node) update = noop) {
    if (is JDefaultedType jDefaultedType = createParser(code).defaultedType(), jDefaultedType.type is JStaticType) {
        return defaultedTypeToCeylon(jDefaultedType, update);
    } else {
        return null;
    }
}
