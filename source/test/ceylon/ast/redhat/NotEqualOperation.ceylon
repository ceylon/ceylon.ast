import ceylon.ast.core {
    NotEqualOperation,
    Precedence11Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    notEqualOperationToCeylon,
    compileNotEqualOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNotEqualOp=NotEqualOp
    }
}

shared object notEqualOperation satisfies ConcreteTest<NotEqualOperation,JNotEqualOp> {
    
    String->NotEqualOperation construct(String->Precedence11Expression left, String->Precedence11Expression right)
            => "``left.key``!=``right.key``"->NotEqualOperation(left.item, right.item);
    
    shared String->NotEqualOperation aNotEqualsBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    "a&b != a&b&c"
    shared String->NotEqualOperation aIntBNotEqualsAIntBIntCExpression = construct(intersectionOperation.aIntersectBExpression, intersectionOperation.aIntersectBIntersectCExpression);
    
    compile = compileNotEqualOperation;
    fromCeylon = RedHatTransformer.transformNotEqualOperation;
    toCeylon = notEqualOperationToCeylon;
    codes = [aNotEqualsBExpression, aIntBNotEqualsAIntBIntCExpression];
}
