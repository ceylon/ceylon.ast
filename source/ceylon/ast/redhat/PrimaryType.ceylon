import ceylon.ast.core {
    Node,
    PrimaryType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JFunctionType=FunctionType,
        JGroupedType=GroupedType,
        JIterableType=IterableType,
        JOptionalType=OptionalType,
        JSequenceType=SequenceType,
        JSimpleType=SimpleType,
        JStaticType=StaticType,
        JTupleType=TupleType
    }
}

"Converts a RedHat AST [[StaticType|JStaticType]] to a `ceylon.ast` [[PrimaryType]]."
shared PrimaryType primaryTypeToCeylon(JStaticType type, Anything(JNode,Node) update = noop) {
    assert (is JSimpleType|JOptionalType|JSequenceType|JTupleType|JIterableType|JFunctionType|JGroupedType type);
    switch (type)
    case (is JSimpleType) { return simpleTypeToCeylon(type, update); }
    case (is JOptionalType) { return optionalTypeToCeylon(type, update); }
    case (is JSequenceType) { return sequentialTypeToCeylon(type, update); }
    case (is JTupleType) { return tupleTypeToCeylon(type, update); }
    case (is JIterableType) { return iterableTypeToCeylon(type, update); }
    case (is JFunctionType) { return callableTypeToCeylon(type, update); }
    case (is JGroupedType) { return groupedTypeToCeylon(type, update); }
}

"Compiles the given [[code]] for a Primary Type
 into a [[PrimaryType]] using the Ceylon compiler
 (more specifically, the rule for a `primaryType`)."
shared PrimaryType? compilePrimaryType(String code, Anything(JNode,Node) update = noop) {
    if (exists jPrimaryType = createParser(code).primaryType()) {
        return primaryTypeToCeylon(jPrimaryType, update);
    } else {
        return null;
    }
}
