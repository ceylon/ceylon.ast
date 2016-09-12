import ceylon.ast.core {
    DefaultedType,
    Node,
    TupleType,
    Type,
    TypeList,
    VariadicType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JTupleType=TupleType
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[TupleType|JTupleType]] to a `ceylon.ast` [[TupleType]]."
shared TupleType tupleTypeToCeylon(JTupleType tupleType, Anything(JNode,Node) update = noop) {
    variable VariadicType? variadicType = null;
    <Type|DefaultedType>[] elementTypes = CeylonIterable(tupleType.elementTypes).collect((Tree.Type jtype) {
            value typeIsh = typeIshToCeylon(jtype, update);
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
    value typeList = TypeList(elementTypes, variadicType);
    update(tupleType, typeList);
    value result = TupleType(typeList);
    update(tupleType, result);
    return result;
}

"Parses the given [[code]] for a Tuple Type
 into a [[TupleType]] using the Ceylon compiler
 (more specifically, the rule for a `tupleType`)."
shared TupleType? parseTupleType(String code, Anything(JNode,Node) update = noop) {
    if (exists jTupleType = createParser(code).tupleType()) {
        return tupleTypeToCeylon(jTupleType, update);
    } else {
        return null;
    }
}
