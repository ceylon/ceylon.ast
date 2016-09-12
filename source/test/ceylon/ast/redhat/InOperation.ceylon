import ceylon.ast.core {
    InOperation,
    ExistsNonemptyExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    inOperationToCeylon,
    parseInOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JInOp=InOp
    }
}

shared object inOperation satisfies ConcreteTest<InOperation,JInOp> {
    
    String->InOperation construct(String->ExistsNonemptyExpression left, String->ExistsNonemptyExpression right)
            => "``left.key`` in ``right.key``"->InOperation(left.item, right.item);
    
    shared String->InOperation cInAIntersectBExpression = construct(baseExpression.cExpression, intersectionOperation.aIntersectBExpression);
    
    parse = parseInOperation;
    fromCeylon = RedHatTransformer.transformInOperation;
    toCeylon = inOperationToCeylon;
    codes = [cInAIntersectBExpression];
}
