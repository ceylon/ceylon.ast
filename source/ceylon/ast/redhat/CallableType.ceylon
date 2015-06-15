import ceylon.ast.core {
    CallableType,
    DefaultedType,
    Node,
    PrimaryType,
    SpreadType,
    Type,
    TypeList,
    VariadicType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JFunctionType=FunctionType,
        JSpreadType=SpreadType,
        JType=Type
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[FunctionType|JFunctionType]] to a `ceylon.ast` [[CallableType]]."
shared CallableType callableTypeToCeylon(JFunctionType callableType, Anything(JNode,Node) update = noop) {
    TypeList|SpreadType argumentTypes;
    if (is JSpreadType spreadType = CeylonIterable(callableType.argumentTypes).first) {
        "Cannot have any other types beside a spread type"
        assert (callableType.argumentTypes.size() == 1);
        argumentTypes = spreadTypeToCeylon(spreadType, update);
    } else {
        variable VariadicType? variadicType = null;
        <Type|DefaultedType>[] argumentTypesSeq = CeylonIterable(callableType.argumentTypes).collect((JType jtype) {
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
            });
        argumentTypes = TypeList(argumentTypesSeq, variadicType);
    }
    assert (is PrimaryType returnType = typeToCeylon(callableType.returnType, update));
    value result = CallableType(returnType, argumentTypes);
    update(callableType, result);
    return result;
}

"Compiles the given [[code]] for a Callable Type
 into a [[CallableType]] using the Ceylon compiler
 (more specifically, the rule for an `primaryType`)."
shared CallableType? compileCallableType(String code, Anything(JNode,Node) update = noop) {
    if (is JFunctionType jFunctionType = createParser(code).primaryType()) {
        return callableTypeToCeylon(jFunctionType, update);
    } else {
        return null;
    }
}
