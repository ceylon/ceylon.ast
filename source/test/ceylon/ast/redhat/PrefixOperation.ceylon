import ceylon.ast.core {
    PrefixOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    prefixOperationToCeylon,
    parsePrefixOperation
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JPrefixOperatorExpression=PrefixOperatorExpression
    }
}

shared object prefixOperation satisfies AbstractTest<PrefixOperation,JPrefixOperatorExpression> {
    parse = parsePrefixOperation;
    fromCeylon = RedHatTransformer.transformPrefixOperation;
    toCeylon = prefixOperationToCeylon;
    
    tests = [prefixIncrementOperation, prefixDecrementOperation];
}
