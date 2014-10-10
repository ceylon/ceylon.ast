import ceylon.ast.core {
    Annotations,
    LIdentifier,
    VariadicParameter,
    VariadicType
}
import ceylon.ast.redhat {
    RedHatTransformer,
    variadicParameterToCeylon,
    compileVariadicParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JValueParameterDeclaration=ValueParameterDeclaration
    }
}

shared object variadicParameter satisfies ConcreteTest<VariadicParameter,JValueParameterDeclaration> {
    
    String->VariadicParameter construct(String->VariadicType type, String->LIdentifier name, String->Annotations annotations = package.annotations.emptyAnnotations)
            => "``annotations.key`` ``type.key````name.key``"->VariadicParameter(type.item, name.item, annotations.item);
    
    shared String->VariadicParameter floatStarLidVariadicParameter = construct(variadicType.floatStarType, identifier.lidLIdentifier);
    
    // not tested directly, but used by other tests
    shared String->VariadicParameter charactersVariadicParameter = construct(variadicType.characterStarType, identifier.charactersLIdentifier);
    
    compile = compileVariadicParameter;
    fromCeylon = RedHatTransformer.transformVariadicParameter;
    toCeylon = variadicParameterToCeylon;
    codes = [floatStarLidVariadicParameter];
}
