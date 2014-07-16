import ceylon.ast.core {
    BinaryOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    binaryOperationToCeylon,
    compileBinaryOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JBinaryOperatorExpression=BinaryOperatorExpression
    }
}

shared object binaryOperation satisfies AbstractTest<BinaryOperation,JBinaryOperatorExpression> {
    compile = compileBinaryOperation;
    fromCeylon = RedHatTransformer.transformBinaryOperation;
    toCeylon = binaryOperationToCeylon;
    
    tests = [arithmeticOperation, setOperation, scaleOperation, spanOperation, measureOperation, entryOperation, inOperation, comparisonOperation, compareOperation, equalityOperation, logicalOperation, thenOperation, elseOperation];
}
