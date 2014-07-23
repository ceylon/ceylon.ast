import ceylon.ast.core {
    Parameters
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JParameterList=ParameterList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ParameterList|JParameterList]] to a `ceylon.ast` [[Parameters]]."
shared Parameters parametersToCeylon(JParameterList parameters) {
    return Parameters(CeylonIterable(parameters.parameters).collect(parameterToCeylon));
}

"Compiles the given [[code]] for a Parameters
 into a [[Parameters]] using the Ceylon compiler
 (more specifically, the rule for a `parameters`)."
shared Parameters? compileParameters(String code) {
    if (exists jParameters = createParser(code).parameters()) {
        return parametersToCeylon(jParameters);
    } else {
        return null;
    }
}
