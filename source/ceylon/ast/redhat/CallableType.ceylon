import ceylon.ast.core {
    CallableType,
    DefaultedType,
    PrimaryType,
    SpreadType,
    Type,
    TypeList,
    VariadicType
}
import com.redhat.ceylon.compiler.typechecker.tree {
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
shared CallableType callableTypeToCeylon(JFunctionType callableType) {
    TypeList|SpreadType argumentTypes;
    if (is JSpreadType spreadType = CeylonIterable(callableType.argumentTypes).first) {
        "Cannot have any other types beside a spread type"
        assert (callableType.argumentTypes.size() == 1);
        argumentTypes = spreadTypeToCeylon(spreadType);
    } else {
        variable VariadicType? variadicType = null;
        <Type|DefaultedType>[] argumentTypesSeq = CeylonIterable(callableType.argumentTypes).collect((JType jtype) {
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
            });
        argumentTypes = TypeList(argumentTypesSeq, variadicType);
    }
    assert (is PrimaryType returnType = typeToCeylon(callableType.returnType));
    return CallableType(returnType, argumentTypes);
}

"Compiles the given [[code]] for a Callable Type
 into a [[CallableType]] using the Ceylon compiler
 (more specifically, the rule for an `primaryType`)."
shared CallableType? compileCallableType(String code) {
    if (is JFunctionType jFunctionType = createParser(code).primaryType()) {
        return callableTypeToCeylon(jFunctionType);
    } else {
        return null;
    }
}
