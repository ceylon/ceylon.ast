import ceylon.ast.core {
    NotEqualOperation,
    ComparingExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    notEqualOperationToCeylon,
    parseNotEqualOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNotEqualOp=NotEqualOp
    }
}

shared object notEqualOperation satisfies ConcreteTest<NotEqualOperation,JNotEqualOp> {
    
    String->NotEqualOperation construct(String->ComparingExpression left, String->ComparingExpression right)
            => "``left.key``!=``right.key``"->NotEqualOperation(left.item, right.item);
    
    shared String->NotEqualOperation aNotEqualsBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    "a&b != a&b&c"
    shared String->NotEqualOperation aIntBNotEqualsAIntBIntCExpression = construct(intersectionOperation.aIntersectBExpression, intersectionOperation.aIntersectBIntersectCExpression);
    
    parse = parseNotEqualOperation;
    fromCeylon = RedHatTransformer.transformNotEqualOperation;
    toCeylon = notEqualOperationToCeylon;
    codes = [aNotEqualsBExpression, aIntBNotEqualsAIntBIntCExpression];
}
