import ceylon.ast.core {
    TypeParameters
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeParameterList=TypeParameterList
    }
}
import ceylon.interop.java {
    CeylonIterable
}

"Converts a RedHat AST [[TypeParameterList|JTypeParameterList]] to `ceylon.ast` [[TypeParameters]]."
shared TypeParameters typeParametersToCeylon(JTypeParameterList typeParameters) {
    assert (nonempty params = CeylonIterable(typeParameters.typeParameterDeclarations).collect(typeParameterToCeylon));
    return TypeParameters(params);
}

"Compiles the given [[code]] for Type Parameters
 into [[TypeParameters]] using the Ceylon compiler
 (more specifically, the rule for `typeParameters`)."
shared TypeParameters? compileTypeParameters(String code) {
    if (exists jTypeParameters = createParser(code).typeParameters()) {
        return typeParametersToCeylon(jTypeParameters);
    } else {
        return null;
    }
}
