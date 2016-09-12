import ceylon.ast.core {
    ThenElseExpression,
    AssigningExpression,
    SubtractAssignmentOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    subtractAssignmentOperationToCeylon,
    parseSubtractAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSubtractAssignOp=SubtractAssignOp
    }
}

shared object subtractAssignmentOperation satisfies ConcreteTest<SubtractAssignmentOperation,JSubtractAssignOp> {
    
    String->SubtractAssignmentOperation construct(String->ThenElseExpression left, String->AssigningExpression right)
            => "``left.key``-=``right.key``"->SubtractAssignmentOperation(left.item, right.item);
    
    shared String->SubtractAssignmentOperation countdownSubtractAssignΔtExpression = construct(baseExpression.countdownExpression, baseExpression.\iΔtExpression);
    
    parse = parseSubtractAssignmentOperation;
    fromCeylon = RedHatTransformer.transformSubtractAssignmentOperation;
    toCeylon = subtractAssignmentOperationToCeylon;
    codes = [countdownSubtractAssignΔtExpression];
}
