import ceylon.ast.core {
    ComplementAssignmentOperation,
    ThenElseExpression,
    AssigningExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    complementAssignmentOperationToCeylon,
    parseComplementAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JComplementAssignOp=ComplementAssignOp
    }
}

shared object complementAssignmentOperation satisfies ConcreteTest<ComplementAssignmentOperation,JComplementAssignOp> {
    
    String->ComplementAssignmentOperation construct(String->ThenElseExpression left, String->AssigningExpression right)
            => "``left.key``~=``right.key``"->ComplementAssignmentOperation(left.item, right.item);
    
    shared String->ComplementAssignmentOperation aComplementAssignBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    parse = parseComplementAssignmentOperation;
    fromCeylon = RedHatTransformer.transformComplementAssignmentOperation;
    toCeylon = complementAssignmentOperationToCeylon;
    codes = [aComplementAssignBExpression];
}
