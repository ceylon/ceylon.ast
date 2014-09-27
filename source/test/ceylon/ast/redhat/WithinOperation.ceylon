import ceylon.ast.core {
    Bound,
    OpenBound,
    ExistsNonemptyExpression,
    WithinOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    withinOperationToCeylon,
    compileWithinOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JWithinOp=WithinOp
    }
}

shared object withinOperation satisfies ConcreteTest<WithinOperation,JWithinOp> {
    
    String->WithinOperation construct(String->ExistsNonemptyExpression operand, String->Bound lowerBound, String->Bound upperBound)
            => (lowerBound.key + (lowerBound.item is OpenBound then "<" else "<=") + operand.key + (upperBound.item is OpenBound then "<" else "<=") + upperBound.key)->WithinOperation(operand.item, lowerBound.item, upperBound.item);
    
    // I know these make no sense, it doesn’t matter
    shared String->WithinOperation doubleOpenWithinOperation = construct(baseExpression.aExpression, openBound.cOpenBound_withCode, openBound._1138OpenBound_withCode);
    shared String->WithinOperation openClosedWithinOperation = construct(baseExpression.aExpression, openBound.cOpenBound_withCode, closedBound._1138ClosedBound_withCode);
    shared String->WithinOperation doubleClosedWithinOperation = construct(baseExpression.aExpression, closedBound.cClosedBound_withCode, closedBound._1138ClosedBound_withCode);
    
    compile = compileWithinOperation;
    fromCeylon = RedHatTransformer.transformWithinOperation;
    toCeylon = withinOperationToCeylon;
    codes = [doubleOpenWithinOperation, openClosedWithinOperation, doubleClosedWithinOperation];
}
