import ceylon.ast.core {
    DefaultedType,
    TupleType,
    Type,
    TypeList,
    VariadicType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTupleType=TupleType
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[TupleType|JTupleType]] to a `ceylon.ast` [[TupleType]]."
shared TupleType tupleTypeToCeylon(JTupleType tupleType) {
    variable VariadicType? variadicType = null;
    <Type|DefaultedType>[] elementTypes = CeylonIterable(tupleType.elementTypes).collect((Tree.Type jtype) {
            value typeIsh = typeIshToCeylon(jtype);
            if (is VariadicType typeIsh) {
                "Can’t have multiple variadic types"
                assert (!(variadicType exists));
                variadicType = typeIsh;
                return null; // filtered out
            } else {
                assert (is Type|DefaultedType typeIsh);
                "Can’t have non-variadic type after variadic type"
                assert (!(variadicType exists));
                return typeIsh;
            }
        }).select((Anything a) => a exists).collect((Type|DefaultedType? element) {
            assert (exists element);
            return element;
        }).sequence();
    return TupleType(TypeList(elementTypes, variadicType));
}

"Compiles the given [[code]] for a Tuple Type
 into a [[TupleType]] using the Ceylon compiler
 (more specifically, the rule for a `tupleType`)."
shared TupleType? compileTupleType(String code) {
    if (exists jTupleType = createParser(code).tupleType()) {
        return tupleTypeToCeylon(jTupleType);
    } else {
        return null;
    }
}
