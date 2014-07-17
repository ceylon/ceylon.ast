import ceylon.ast.core {
    Precedence16Expression,
    Precedence17Expression,
    SubtractAssignmentOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    subtractAssignmentOperationToCeylon,
    compileSubtractAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSubtractAssignOp=SubtractAssignOp
    }
}

shared object subtractAssignmentOperation satisfies ConcreteTest<SubtractAssignmentOperation,JSubtractAssignOp> {
    
    String->SubtractAssignmentOperation construct(String->Precedence16Expression left, String->Precedence17Expression right)
            => "``left.key``-=``right.key``"->SubtractAssignmentOperation(left.item, right.item);
    
    shared String->SubtractAssignmentOperation countdownSubtractAssignΔtExpression = construct(baseExpression.countdownExpression, baseExpression.\iΔtExpression);
    
    compile = compileSubtractAssignmentOperation;
    fromCeylon = RedHatTransformer.transformSubtractAssignmentOperation;
    toCeylon = subtractAssignmentOperationToCeylon;
    codes = [countdownSubtractAssignΔtExpression];
}
