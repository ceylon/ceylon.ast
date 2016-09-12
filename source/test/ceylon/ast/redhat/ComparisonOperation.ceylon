import ceylon.ast.core {
    ComparisonOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    comparisonOperationToCeylon,
    parseComparisonOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JComparisonOp=ComparisonOp
    }
}

shared object comparisonOperation satisfies AbstractTest<ComparisonOperation,JComparisonOp> {
    parse = parseComparisonOperation;
    fromCeylon = RedHatTransformer.transformComparisonOperation;
    toCeylon = comparisonOperationToCeylon;
    
    tests = [largerOperation, smallerOperation, largeAsOperation, smallAsOperation];
}
