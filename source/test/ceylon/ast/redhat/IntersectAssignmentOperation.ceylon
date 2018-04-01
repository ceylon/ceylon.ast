import ceylon.ast.core {
    IntersectAssignmentOperation,
    ThenElseExpression,
    AssigningExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    intersectAssignmentOperationToCeylon,
    parseIntersectAssignmentOperation
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JIntersectAssignOp=IntersectAssignOp
    }
}

shared object intersectAssignmentOperation satisfies ConcreteTest<IntersectAssignmentOperation,JIntersectAssignOp> {
    
    String->IntersectAssignmentOperation construct(String->ThenElseExpression left, String->AssigningExpression right)
            => "``left.key``&=``right.key``" -> IntersectAssignmentOperation(left.item, right.item);
    
    shared String->IntersectAssignmentOperation aIntersectAssignBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    parse = parseIntersectAssignmentOperation;
    fromCeylon = RedHatTransformer.transformIntersectAssignmentOperation;
    toCeylon = intersectAssignmentOperationToCeylon;
    codes = [aIntersectAssignBExpression];
}
