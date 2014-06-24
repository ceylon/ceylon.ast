import ceylon.ast.core {
    Type
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JGroupedType=GroupedType,
        JIterableType=IterableType,
        JOptionalType=OptionalType,
        JSequenceType=SequenceType,
        JSimpleType=SimpleType,
        JStaticType=StaticType,
        JTupleType=TupleType
    }
}
import ceylon.ast.redhat {
    groupedTypeToCeylon,
    createParser,
    simpleTypeToCeylon
}

"Converts a RedHat AST [[StaticType|JStaticType]] to a `ceylon.ast` [[Type]]."
shared Type typeToCeylon(JStaticType type) {
    switch (type)
    case (is JSimpleType) { return simpleTypeToCeylon(type); }
    case (is JTupleType) { return tupleTypeToCeylon(type); }
    case (is JIterableType) { return iterableTypeToCeylon(type); }
    case (is JGroupedType) { return groupedTypeToCeylon(type); }
    case (is JOptionalType) { return optionalTypeToCeylon(type); }
    case (is JSequenceType) { return sequentialTypeToCeylon(type); }
    else {
        throw Error("Not yet implemented!"); // TODO
    }
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
