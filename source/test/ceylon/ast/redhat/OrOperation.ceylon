import ceylon.ast.core {
    OrOperation,
    ConjoiningExpression,
    DisjoiningExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    orOperationToCeylon,
    parseOrOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JOrOp=OrOp
    }
}

shared object orOperation satisfies ConcreteTest<OrOperation,JOrOp> {
    
    String->OrOperation construct(String->DisjoiningExpression left, String->ConjoiningExpression right)
            => "``left.key``||``right.key``"->OrOperation(left.item, right.item);
    
    shared String->OrOperation aOrBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    
    parse = parseOrOperation;
    fromCeylon = RedHatTransformer.transformOrOperation;
    toCeylon = orOperationToCeylon;
    codes = [aOrBExpression];
}
