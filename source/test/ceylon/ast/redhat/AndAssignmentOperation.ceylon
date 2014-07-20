import ceylon.ast.core {
    AndAssignmentOperation,
    Precedence16Expression,
    Precedence18Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    andAssignmentOperationToCeylon,
    compileAndAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAndAssignOp=AndAssignOp
    }
}

shared object andAssignmentOperation satisfies ConcreteTest<AndAssignmentOperation,JAndAssignOp> {
    
    String->AndAssignmentOperation construct(String->Precedence16Expression leftOperand, String->Precedence18Expression rightOperand)
            => "``leftOperand.key``&&=``rightOperand.key``"->AndAssignmentOperation(leftOperand.item, rightOperand.item);
    
    shared String->AndAssignmentOperation bAndAssignAExistsExpression = construct(baseExpression.bExpression, existsOperation.aExistsExpression);
    
    compile = compileAndAssignmentOperation;
    fromCeylon = RedHatTransformer.transformAndAssignmentOperation;
    toCeylon = andAssignmentOperationToCeylon;
    codes = [bAndAssignAExistsExpression];
}
