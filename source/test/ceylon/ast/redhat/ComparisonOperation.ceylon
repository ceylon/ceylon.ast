import ceylon.ast.core {
    ComparisonOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    comparisonOperationToCeylon,
    compileComparisonOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JComparisonOp=ComparisonOp
    }
}

shared object comparisonOperation satisfies AbstractTest<ComparisonOperation,JComparisonOp> {
    compile = compileComparisonOperation;
    fromCeylon = RedHatTransformer.transformComparisonOperation;
    toCeylon = comparisonOperationToCeylon;
    
    tests = [largerOperation, smallerOperation, largeAsOperation, smallAsOperation];
}
