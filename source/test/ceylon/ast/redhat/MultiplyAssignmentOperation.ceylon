import ceylon.ast.core {
    MultiplyAssignmentOperation,
    ThenElseExpression,
    AssigningExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    multiplyAssignmentOperationToCeylon,
    compileMultiplyAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JMultiplyAssignOp=MultiplyAssignOp
    }
}

shared object multiplyAssignmentOperation satisfies ConcreteTest<MultiplyAssignmentOperation,JMultiplyAssignOp> {
    
    String->MultiplyAssignmentOperation construct(String->ThenElseExpression leftOperand, String->AssigningExpression rightOperand)
            => "``leftOperand.key``*=``rightOperand.key``"->MultiplyAssignmentOperation(leftOperand.item, rightOperand.item);
    
    shared String->MultiplyAssignmentOperation balanceAssignOnePlusInterestRateExpression = construct(baseExpression.balanceExpression, sumOperation.onePlusInterestRateExpression);
    
    compile = compileMultiplyAssignmentOperation;
    fromCeylon = RedHatTransformer.transformMultiplyAssignmentOperation;
    toCeylon = multiplyAssignmentOperationToCeylon;
    codes = [balanceAssignOnePlusInterestRateExpression];
}
