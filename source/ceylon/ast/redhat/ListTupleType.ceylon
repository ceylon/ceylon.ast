import ceylon.ast.core {
    DefaultedType,
    Node,
    ListTupleType,
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

"Converts a RedHat AST [[TupleType|JTupleType]] to a `ceylon.ast` [[ListTupleType]]."
shared ListTupleType listTupleTypeToCeylon(JTupleType tupleType, Anything(JNode,Node) update = noop) {
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
    value result = ListTupleType(typeList);
    update(tupleType, result);
    return result;
}

"Compiles the given [[code]] for a Tuple Type
 into a [[ListTupleType]] using the Ceylon compiler
 (more specifically, the rule for a `tupleType`)."
shared ListTupleType? compileListTupleType(String code, Anything(JNode,Node) update = noop) {
    if (exists jTupleType = createParser(code).tupleType()) {
        return listTupleTypeToCeylon(jTupleType, update);
    } else {
        return null;
    }
}
