import ceylon.ast.core {
    MultiplyAssignmentOperation,
    Precedence16Expression,
    Precedence18Expression
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
    
    String->MultiplyAssignmentOperation construct(String->Precedence16Expression leftOperand, String->Precedence18Expression rightOperand)
            => "``leftOperand.key``*=``rightOperand.key``"->MultiplyAssignmentOperation(leftOperand.item, rightOperand.item);
    
    shared String->MultiplyAssignmentOperation balanceAssignOnePlusInterestRateExpression = construct(baseExpression.balanceExpression, sumOperation.onePlusInterestRateExpression);
    
    compile = compileMultiplyAssignmentOperation;
    fromCeylon = RedHatTransformer.transformMultiplyAssignmentOperation;
    toCeylon = multiplyAssignmentOperationToCeylon;
    codes = [balanceAssignOnePlusInterestRateExpression];
}
