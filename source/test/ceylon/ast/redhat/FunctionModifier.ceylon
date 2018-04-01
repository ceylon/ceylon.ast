import ceylon.ast.core {
    FunctionModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    functionModifierToCeylon,
    parseFunctionModifier
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionModifier=FunctionModifier
    }
}

shared object functionModifier satisfies ConcreteTest<FunctionModifier,JFunctionModifier> {
    
    shared String->FunctionModifier functionModifier = "function" -> FunctionModifier();
    
    parse = parseFunctionModifier;
    fromCeylon = RedHatTransformer.transformFunctionModifier;
    toCeylon = functionModifierToCeylon;
    codes = [functionModifier];
}
