import ceylon.ast.core {
    ThenElseExpression,
    AssigningExpression,
    UnionAssignmentOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unionAssignmentOperationToCeylon,
    compileUnionAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JUnionAssignOp=UnionAssignOp
    }
}

shared object unionAssignmentOperation satisfies ConcreteTest<UnionAssignmentOperation,JUnionAssignOp> {
    
    String->UnionAssignmentOperation construct(String->ThenElseExpression left, String->AssigningExpression right)
            => "``left.key``|=``right.key``"->UnionAssignmentOperation(left.item, right.item);
    
    shared String->UnionAssignmentOperation aUnionAssignBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    compile = compileUnionAssignmentOperation;
    fromCeylon = RedHatTransformer.transformUnionAssignmentOperation;
    toCeylon = unionAssignmentOperationToCeylon;
    codes = [aUnionAssignBExpression];
}
