import ceylon.ast.core {
    ComplementOperation,
    IntersectingExpression,
    UnioningExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    complementOperationToCeylon,
    parseComplementOperation
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JComplementOp=ComplementOp
    }
}

shared object complementOperation satisfies ConcreteTest<ComplementOperation,JComplementOp> {
    
    String->ComplementOperation construct(String->UnioningExpression left, String->IntersectingExpression right)
            => "``left.key``~``right.key``" -> ComplementOperation(left.item, right.item);
    
    shared String->ComplementOperation aComplementBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    shared String->ComplementOperation aUnionBComplementAIntersectBExpression = construct(unionOperation.aUnionBExpression, intersectionOperation.aIntersectBExpression);
    
    parse = parseComplementOperation;
    fromCeylon = RedHatTransformer.transformComplementOperation;
    toCeylon = complementOperationToCeylon;
    codes = [aComplementBExpression, aUnionBComplementAIntersectBExpression];
}
