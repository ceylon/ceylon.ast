import ceylon.ast.core {
    Type,
    TypeParameter,
    UIdentifier,
    Variance
}
import ceylon.ast.redhat {
    RedHatTransformer,
    typeParameterToCeylon,
    parseTypeParameter
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JTypeParameterDeclaration=TypeParameterDeclaration
    }
}

shared object typeParameter satisfies ConcreteTest<TypeParameter,JTypeParameterDeclaration> {
    
    String->TypeParameter construct(String->UIdentifier parameterName, <String->Variance>? variance = null, <String->Type>? defaultArgument = null)
            => "`` variance?.key else "" `` ``parameterName.key`` `` defaultArgument?.key exists then "=`` defaultArgument?.key else "" ``" else "" ``" -> TypeParameter(parameterName.item, variance?.item, defaultArgument?.item);
    
    shared String->TypeParameter uidTypeParameter = construct(identifier.uidUIdentifier);
    shared String->TypeParameter outLidDefaultstoAnythingTypeParameter = construct(identifier.lidUIdentifier, outModifier.outModifier, baseType.anythingType);
    
    parse = parseTypeParameter;
    fromCeylon = RedHatTransformer.transformTypeParameter;
    toCeylon = typeParameterToCeylon;
    codes = [uidTypeParameter, outLidDefaultstoAnythingTypeParameter];
}
