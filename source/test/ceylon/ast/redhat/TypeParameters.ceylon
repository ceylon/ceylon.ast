import ceylon.ast.core {
    TypeParameter,
    TypeParameters
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeParametersToCeylon,
    compileTypeParameters
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeParameterList=TypeParameterList
    }
}

shared object typeParameters satisfies ConcreteTest<TypeParameters,JTypeParameterList> {
    
    String->TypeParameters construct(<String->TypeParameter>+ typeParameters)
            => "<``",".join(typeParameters*.key)``>"->TypeParameters(typeParameters*.item);
    
    shared String->TypeParameters twoTypeParameters = construct(typeParameter.uidTypeParameter, typeParameter.outLidDefaultstoAnythingTypeParameter);
    
    compile = compileTypeParameters;
    fromCeylon = RedHatTransformer.transformTypeParameters;
    toCeylon = typeParametersToCeylon;
    codes = [twoTypeParameters];
}
