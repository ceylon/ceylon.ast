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
    
    String->VariadicParameter construct(String->Annotations annotations, String->VariadicType type, String->LIdentifier name)
            => "``annotations.key`` ``type.key````name.key``"->VariadicParameter(annotations.item, type.item, name.item);
    
    shared String->VariadicParameter floatStarLidVariadicParameter = construct(annotations.emptyAnnotations, variadicType.floatStarType, identifier.lidLIdentifier);
    
    compile = compileVariadicParameter;
    fromCeylon = RedHatTransformer.transformVariadicParameter;
    toCeylon = variadicParameterToCeylon;
    codes = [floatStarLidVariadicParameter];
}
