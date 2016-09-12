import ceylon.ast.core {
    IntersectionOperation,
    InvertingExpression,
    IntersectingExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    intersectionOperationToCeylon,
    parseIntersectionOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIntersectionOp=IntersectionOp
    }
}

shared object intersectionOperation satisfies ConcreteTest<IntersectionOperation,JIntersectionOp> {
    
    String->IntersectionOperation construct(String->IntersectingExpression left, String->InvertingExpression right)
            => "``left.key``&``right.key``"->IntersectionOperation(left.item, right.item);
    
    shared String->IntersectionOperation aIntersectBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    shared String->IntersectionOperation aIntersectBIntersectCExpression = construct(aIntersectBExpression, baseExpression.cExpression);
    
    parse = parseIntersectionOperation;
    fromCeylon = RedHatTransformer.transformIntersectionOperation;
    toCeylon = intersectionOperationToCeylon;
    codes = [aIntersectBExpression, aIntersectBIntersectCExpression];
}
