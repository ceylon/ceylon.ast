import ceylon.ast.core {
    IntersectAssignmentOperation,
    ThenElseExpression,
    AssigningExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    intersectAssignmentOperationToCeylon,
    compileIntersectAssignmentOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIntersectAssignOp=IntersectAssignOp
    }
}

shared object intersectAssignmentOperation satisfies ConcreteTest<IntersectAssignmentOperation,JIntersectAssignOp> {
    
    String->IntersectAssignmentOperation construct(String->ThenElseExpression left, String->AssigningExpression right)
            => "``left.key``&=``right.key``"->IntersectAssignmentOperation(left.item, right.item);
    
    shared String->IntersectAssignmentOperation aIntersectAssignBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    compile = compileIntersectAssignmentOperation;
    fromCeylon = RedHatTransformer.transformIntersectAssignmentOperation;
    toCeylon = intersectAssignmentOperationToCeylon;
    codes = [aIntersectAssignBExpression];
}
