import ceylon.ast.core {
    AddAssignmentOperation,
    ThenElseExpression,
    AssigningExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    addAssignmentOperationToCeylon,
    parseAddAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAddAssignOp=AddAssignOp
    }
}

shared object addAssignmentOperation satisfies ConcreteTest<AddAssignmentOperation,JAddAssignOp> {
    
    String->AddAssignmentOperation construct(String->ThenElseExpression left, String->AssigningExpression right)
            => "``left.key``+=``right.key``"->AddAssignmentOperation(left.item, right.item);
    
    shared String->AddAssignmentOperation iAddAssignStepExpression = construct(baseExpression.iExpression, baseExpression.stepExpression);
    shared String->AddAssignmentOperation iAddAssignIfExpression = construct(baseExpression.iExpression, ifElseExpression.ifThen1Else1Expression);
    
    parse = parseAddAssignmentOperation;
    fromCeylon = RedHatTransformer.transformAddAssignmentOperation;
    toCeylon = addAssignmentOperationToCeylon;
    codes = [iAddAssignStepExpression, iAddAssignIfExpression];
}
