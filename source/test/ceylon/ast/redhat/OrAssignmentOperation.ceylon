import ceylon.ast.core {
    OrAssignmentOperation,
    Precedence16Expression,
    Precedence18Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    orAssignmentOperationToCeylon,
    compileOrAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOrAssignOp=OrAssignOp
    }
}

shared object orAssignmentOperation satisfies ConcreteTest<OrAssignmentOperation,JOrAssignOp> {
    
    String->OrAssignmentOperation construct(String->Precedence16Expression leftOperand, String->Precedence18Expression rightOperand)
            => "``leftOperand.key``||=``rightOperand.key``"->OrAssignmentOperation(leftOperand.item, rightOperand.item);
    
    shared String->OrAssignmentOperation bOrAssignAExistsExpression = construct(baseExpression.bExpression, existsOperation.aExistsExpression);
    
    compile = compileOrAssignmentOperation;
    fromCeylon = RedHatTransformer.transformOrAssignmentOperation;
    toCeylon = orAssignmentOperationToCeylon;
    codes = [bOrAssignAExistsExpression];
}
