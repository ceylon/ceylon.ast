import ceylon.ast.core {
    Type
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JEntryType=EntryType,
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
shared Type typeToCeylon(JStaticType type) {
    assert (is JSimpleType|JOptionalType|JSequenceType|JTupleType|JIterableType|JUnionType|JIntersectionType|JGroupedType|JEntryType type);
    switch (type)
    case (is JSimpleType) { return simpleTypeToCeylon(type); }
    case (is JOptionalType) { return optionalTypeToCeylon(type); }
    case (is JSequenceType) { return sequentialTypeToCeylon(type); }
    case (is JTupleType) { return tupleTypeToCeylon(type); }
    case (is JIterableType) { return iterableTypeToCeylon(type); }
    case (is JUnionType) { return unionTypeToCeylon(type); }
    case (is JIntersectionType) { return intersectionTypeToCeylon(type); }
    case (is JGroupedType) { return groupedTypeToCeylon(type); }
    case (is JEntryType) { return entryTypeToCeylon(type); }
}

"Compiles the given [[code]] for a Type
 into a [[Type]] using the Ceylon compiler
 (more specifically, the rule for a `type`)."
shared Type? compileType(String code) {
    if (exists jType = createParser(code).type()) {
        return typeToCeylon(jType);
    } else {
        return null;
    }
}
