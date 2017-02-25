import ceylon.ast.core {
    IntersectingExpression,
    UnioningExpression,
    UnionOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    unionOperationToCeylon,
    parseUnionOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JUnionOp=UnionOp
    }
}

shared object unionOperation satisfies ConcreteTest<UnionOperation,JUnionOp> {
    
    String->UnionOperation construct(String->UnioningExpression left, String->IntersectingExpression right)
            => "``left.key``|``right.key``" -> UnionOperation(left.item, right.item);
    
    shared String->UnionOperation aUnionBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    parse = parseUnionOperation;
    fromCeylon = RedHatTransformer.transformUnionOperation;
    toCeylon = unionOperationToCeylon;
    codes = [aUnionBExpression];
}
