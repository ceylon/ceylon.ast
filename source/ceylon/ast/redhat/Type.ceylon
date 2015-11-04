import ceylon.ast.core {
    Node,
    Type
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JEntryType=EntryType,
        JFunctionType=FunctionType,
        JGroupedType=GroupedType,
        JIntersectionType=IntersectionType,
        JIterableType=IterableType,
        JOptionalType=OptionalType,
        JSequenceType=SequenceType,
        JSimpleType=SimpleType,
        JStaticType=StaticType,
        JTupleType=TupleType,
        JUnionType=UnionType
    }
}
import ceylon.ast.redhat {
    groupedTypeToCeylon,
    createParser,
    simpleTypeToCeylon
}

"Converts a RedHat AST [[StaticType|JStaticType]] to a `ceylon.ast` [[Type]]."
shared Type typeToCeylon(JStaticType type, Anything(JNode,Node) update = noop) {
    assert (is JSimpleType|JOptionalType|JSequenceType|JTupleType|JIterableType|JUnionType|JIntersectionType|JFunctionType|JGroupedType|JEntryType type);
    switch (type)
    case (is JSimpleType) { return simpleTypeToCeylon(type, update); }
    case (is JOptionalType) { return optionalTypeToCeylon(type, update); }
    case (is JSequenceType) {
        if (type.length exists) {
            return lengthTupleTypeToCeylon(type, update);
        } else {
            return sequentialTypeToCeylon(type, update);
        }
    }
    case (is JTupleType) { return listTupleTypeToCeylon(type, update); }
    case (is JIterableType) { return iterableTypeToCeylon(type, update); }
    case (is JUnionType) { return unionTypeToCeylon(type, update); }
    case (is JIntersectionType) { return intersectionTypeToCeylon(type, update); }
    case (is JFunctionType) { return callableTypeToCeylon(type, update); }
    case (is JGroupedType) { return groupedTypeToCeylon(type, update); }
    case (is JEntryType) { return entryTypeToCeylon(type, update); }
}

"Compiles the given [[code]] for a Type
 into a [[Type]] using the Ceylon compiler
 (more specifically, the rule for a `type`)."
shared Type? compileType(String code, Anything(JNode,Node) update = noop) {
    if (exists jType = createParser(code).type()) {
        return typeToCeylon(jType, update);
    } else {
        return null;
    }
}
