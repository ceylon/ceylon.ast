import ceylon.ast.core {
    IterableType,
    VariadicType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIterableType=IterableType
    }
}

"Converts a RedHat AST [[IterableType|JIterableType]] to a `ceylon.ast` [[IterableType]]."
shared IterableType iterableTypeToCeylon(JIterableType iterableType) {
    assert (exists elemType = iterableType.elementType, is VariadicType varType = typeIshToCeylon(elemType));
    return IterableType(varType);
}

"Compiles the given [[code]] for an Iterable Type
 into an [[IterableType]] using the Ceylon compiler
 (more specifically, the rule for an `iterableType`)."
shared IterableType? compileIterableType(String code) {
    if (exists jIterableType = createParser(code).iterableType()) {
        return iterableTypeToCeylon(jIterableType);
    } else {
        return null;
    }
}
