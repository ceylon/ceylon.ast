import ceylon.ast.core {
    DefaultedValueParameter,
    Specifier,
    ValueParameter
}
import ceylon.ast.redhat {
    RedHatTransformer,
    defaultedValueParameterToCeylon,
    parseDefaultedValueParameter
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JValueParameterDeclaration=ValueParameterDeclaration
    }
}

shared object defaultedValueParameter satisfies ConcreteTest<DefaultedValueParameter,JValueParameterDeclaration> {
    
    String->DefaultedValueParameter construct(String->ValueParameter parameter, String->Specifier specifier)
            => "``parameter.key````specifier.key``"->DefaultedValueParameter(parameter.item, specifier.item);
    
    shared String->DefaultedValueParameter dynamicByDefaultsto0DefaultedValueParameter = construct(valueParameter.dynamicByValueParameter, specifier._0Specifier);
    shared String->DefaultedValueParameter annotatedStringLidDefaultstoNameElsoWorldGroupedDefaultedValueParameter = construct(valueParameter.annotatedStringLidValueParameter, specifier.nameElseWorldStringLiteralGroupedSpecifier);
    
    parse = parseDefaultedValueParameter;
    fromCeylon = RedHatTransformer.transformDefaultedValueParameter;
    toCeylon = defaultedValueParameterToCeylon;
    codes = [dynamicByDefaultsto0DefaultedValueParameter, annotatedStringLidDefaultstoNameElsoWorldGroupedDefaultedValueParameter];
}
