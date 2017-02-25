import ceylon.ast.core {
    OrAssignmentOperation,
    ThenElseExpression,
    AssigningExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    orAssignmentOperationToCeylon,
    parseOrAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOrAssignOp=OrAssignOp
    }
}

shared object orAssignmentOperation satisfies ConcreteTest<OrAssignmentOperation,JOrAssignOp> {
    
    String->OrAssignmentOperation construct(String->ThenElseExpression leftOperand, String->AssigningExpression rightOperand)
            => "``leftOperand.key``||=``rightOperand.key``" -> OrAssignmentOperation(leftOperand.item, rightOperand.item);
    
    shared String->OrAssignmentOperation bOrAssignAExistsExpression = construct(baseExpression.bExpression, existsOperation.aExistsExpression);
    
    parse = parseOrAssignmentOperation;
    fromCeylon = RedHatTransformer.transformOrAssignmentOperation;
    toCeylon = orAssignmentOperationToCeylon;
    codes = [bOrAssignAExistsExpression];
}
