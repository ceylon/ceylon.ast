import ceylon.ast.core {
    ThenElseExpression,
    AssigningExpression,
    RemainderAssignmentOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    remainderAssignmentOperationToCeylon,
    compileRemainderAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JRemainderAssignOp=RemainderAssignOp
    }
}

shared object remainderAssignmentOperation satisfies ConcreteTest<RemainderAssignmentOperation,JRemainderAssignOp> {
    
    String->RemainderAssignmentOperation construct(String->ThenElseExpression left, String->AssigningExpression right)
            => "``left.key``%=``right.key``"->RemainderAssignmentOperation(left.item, right.item);
    
    shared String->RemainderAssignmentOperation incrementRemainderAssignStepExpression = construct(baseExpression.incrementExpression, baseExpression.stepExpression);
    
    compile = compileRemainderAssignmentOperation;
    fromCeylon = RedHatTransformer.transformRemainderAssignmentOperation;
    toCeylon = remainderAssignmentOperationToCeylon;
    codes = [incrementRemainderAssignStepExpression];
}
