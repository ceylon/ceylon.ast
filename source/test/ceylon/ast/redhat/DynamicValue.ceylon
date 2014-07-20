import ceylon.ast.core {
    DynamicValue,
    NamedArguments
}
import ceylon.ast.redhat {
    RedHatTransformer,
    dynamicValueToCeylon,
    compileDynamicValue
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamic=Dynamic
    }
}

shared object dynamicValue satisfies ConcreteTest<DynamicValue,JDynamic> {
    
    String->DynamicValue construct(String->NamedArguments content)
            => "value``content.key``"->DynamicValue(content.item);
    
    shared String->DynamicValue abcabcDynamicValue = construct(namedArguments.abcabcNamedArguments);
    
    compile = compileDynamicValue;
    fromCeylon = RedHatTransformer.transformDynamicValue;
    toCeylon = dynamicValueToCeylon;
    codes = [abcabcDynamicValue];
}
