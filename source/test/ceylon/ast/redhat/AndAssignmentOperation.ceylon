import ceylon.ast.core {
    AndAssignmentOperation,
    ThenElseExpression,
    AssigningExpression
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
    
    String->AndAssignmentOperation construct(String->ThenElseExpression leftOperand, String->AssigningExpression rightOperand)
            => "``leftOperand.key``&&=``rightOperand.key``"->AndAssignmentOperation(leftOperand.item, rightOperand.item);
    
    shared String->AndAssignmentOperation bAndAssignAExistsExpression = construct(baseExpression.bExpression, existsOperation.aExistsExpression);
    
    compile = compileAndAssignmentOperation;
    fromCeylon = RedHatTransformer.transformAndAssignmentOperation;
    toCeylon = andAssignmentOperationToCeylon;
    codes = [bAndAssignAExistsExpression];
}
