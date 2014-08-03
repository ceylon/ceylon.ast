import ceylon.ast.core {
    FunctionModifier
}
import ceylon.ast.redhat {
    RedHatTransformer,
    functionModifierToCeylon,
    compileFunctionModifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JFunctionModifier=FunctionModifier
    }
}

shared object functionModifier satisfies ConcreteTest<FunctionModifier,JFunctionModifier> {
    
    shared String->FunctionModifier functionModifier = "function"->FunctionModifier();
    
    compile = compileFunctionModifier;
    fromCeylon = RedHatTransformer.transformFunctionModifier;
    toCeylon = functionModifierToCeylon;
    codes = [functionModifier];
}
