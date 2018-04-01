import ceylon.ast.core {
    Node,
    TypeParameters
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JTypeParameterList=TypeParameterList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[TypeParameterList|JTypeParameterList]] to `ceylon.ast` [[TypeParameters]]."
shared TypeParameters typeParametersToCeylon(JTypeParameterList typeParameters, Anything(JNode, Node) update = noop) {
    assert (nonempty params = CeylonIterable(typeParameters.typeParameterDeclarations).collect(propagateUpdate(typeParameterToCeylon, update)));
    value result = TypeParameters(params);
    update(typeParameters, result);
    return result;
}

"Parses the given [[code]] for Type Parameters
 into [[TypeParameters]] using the Ceylon compiler
 (more specifically, the rule for `typeParameters`)."
shared TypeParameters? parseTypeParameters(String code, Anything(JNode, Node) update = noop) {
    if (exists jTypeParameters = createParser(code).typeParameters()) {
        return typeParametersToCeylon(jTypeParameters, update);
    } else {
        return null;
    }
}
