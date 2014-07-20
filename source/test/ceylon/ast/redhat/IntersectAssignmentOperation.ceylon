import ceylon.ast.core {
    IntersectAssignmentOperation,
    Precedence16Expression,
    Precedence18Expression
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
    
    String->IntersectAssignmentOperation construct(String->Precedence16Expression left, String->Precedence18Expression right)
            => "``left.key``&=``right.key``"->IntersectAssignmentOperation(left.item, right.item);
    
    shared String->IntersectAssignmentOperation aIntersectAssignBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    compile = compileIntersectAssignmentOperation;
    fromCeylon = RedHatTransformer.transformIntersectAssignmentOperation;
    toCeylon = intersectAssignmentOperationToCeylon;
    codes = [aIntersectAssignBExpression];
}
