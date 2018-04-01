import ceylon.ast.core {
    ArgumentList,
    DynamicValue,
    NamedArgument
}
import ceylon.ast.redhat {
    RedHatTransformer,
    dynamicValueToCeylon,
    parseDynamicValue
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JDynamic=Dynamic
    }
}

shared object dynamicValue satisfies ConcreteTest<DynamicValue,JDynamic> {
    
    String->DynamicValue construct(<String->NamedArgument>[] namedArguments, String->ArgumentList iterableArgument)
            => "dynamic [``";\n".join(namedArguments*.key)``\n``iterableArgument.key``]" -> DynamicValue(namedArguments*.item, iterableArgument.item);
    
    shared String->DynamicValue abcabcDynamicValue = construct([anonymousArgument.aTimesBPlusCAnonymousArgument], argumentList.abcArgumentList);
    
    parse = parseDynamicValue;
    fromCeylon = RedHatTransformer.transformDynamicValue;
    toCeylon = dynamicValueToCeylon;
    codes = [abcabcDynamicValue];
}
