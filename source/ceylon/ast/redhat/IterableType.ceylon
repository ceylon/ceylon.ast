import ceylon.ast.core {
    IterableType,
    Node,
    VariadicType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JIterableType=IterableType
    }
}

"Converts a RedHat AST [[IterableType|JIterableType]] to a `ceylon.ast` [[IterableType]]."
shared IterableType iterableTypeToCeylon(JIterableType iterableType, Anything(JNode,Node) update = noop) {
    assert (exists elemType = iterableType.elementType, is VariadicType varType = typeIshToCeylon(elemType, update));
    value result = IterableType(varType);
    update(iterableType, result);
    return result;
}

"Compiles the given [[code]] for an Iterable Type
 into an [[IterableType]] using the Ceylon compiler
 (more specifically, the rule for an `iterableType`)."
shared IterableType? compileIterableType(String code, Anything(JNode,Node) update = noop) {
    if (exists jIterableType = createParser(code).iterableType()) {
        return iterableTypeToCeylon(jIterableType, update);
    } else {
        return null;
    }
}
