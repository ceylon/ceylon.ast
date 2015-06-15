import ceylon.ast.core {
    Node,
    Parameters
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JParameterList=ParameterList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[ParameterList|JParameterList]] to a `ceylon.ast` [[Parameters]]."
shared Parameters parametersToCeylon(JParameterList parameters, Anything(JNode,Node) update = noop) {
    value result = Parameters(CeylonIterable(parameters.parameters).collect(propagateUpdate(parameterToCeylon, update)));
    update(parameters, result);
    return result;
}

"Compiles the given [[code]] for a Parameters
 into a [[Parameters]] using the Ceylon compiler
 (more specifically, the rule for a `parameters`)."
shared Parameters? compileParameters(String code, Anything(JNode,Node) update = noop) {
    if (exists jParameters = createParser(code).parameters()) {
        return parametersToCeylon(jParameters, update);
    } else {
        return null;
    }
}
