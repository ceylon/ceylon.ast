import ceylon.ast.core {
    PrefixOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    prefixOperationToCeylon,
    compilePrefixOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPrefixOperatorExpression=PrefixOperatorExpression
    }
}

shared object prefixOperation satisfies AbstractTest<PrefixOperation,JPrefixOperatorExpression> {
    compile = compilePrefixOperation;
    fromCeylon = RedHatTransformer.transformPrefixOperation;
    toCeylon = prefixOperationToCeylon;
    
    tests = [prefixIncrementOperation, prefixDecrementOperation];
}
