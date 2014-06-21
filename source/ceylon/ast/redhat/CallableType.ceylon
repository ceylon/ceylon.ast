import ceylon.ast.api {
    CallableType,
    DefaultedType,
    PrimaryType,
    Type,
    TypeList,
    VariadicType
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionType=FunctionType
    }
}
import ceylon.interop.java {
    CeylonIterable
}
import ceylon.ast.redhat {
    createParser
}

"Converts a RedHat AST [[FunctionType|JFunctionType]] to a `ceylon.ast` [[CallableType]]."
shared CallableType callableTypeToCeylon(JFunctionType callableType) {
    variable VariadicType? variadicType = null;
    <Type|DefaultedType>[] argumentTypes = CeylonIterable(callableType.argumentTypes).collect((Tree.Type jtype) {
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
    assert (is PrimaryType returnType = typeToCeylon(callableType.returnType));
    return CallableType(returnType, TypeList(argumentTypes, variadicType));
}

"Compiles the given [[code]] for a Callable Type
 into a [[CallableType]] using the Ceylon compiler
 (more specifically, the rule for an `abbrevatedType`)."
shared CallableType? compileCallableType(String code) {
    if (is JFunctionType jFunctionType = createParser(code).abbreviatedType()) {
        return callableTypeToCeylon(jFunctionType);
    } else {
        return null;
    }
}
