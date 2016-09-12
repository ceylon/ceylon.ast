import ceylon.ast.core {
    EqualOperation,
    ComparingExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    equalOperationToCeylon,
    parseEqualOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JEqualOp=EqualOp
    }
}

shared object equalOperation satisfies ConcreteTest<EqualOperation,JEqualOp> {
    
    String->EqualOperation construct(String->ComparingExpression left, String->ComparingExpression right)
            => "``left.key``==``right.key``"->EqualOperation(left.item, right.item);
    
    shared String->EqualOperation aEqualsBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    "a&b == a&b&c"
    shared String->EqualOperation aIntBEqualsAIntBIntCExpression = construct(intersectionOperation.aIntersectBExpression, intersectionOperation.aIntersectBIntersectCExpression);
    
    parse = parseEqualOperation;
    fromCeylon = RedHatTransformer.transformEqualOperation;
    toCeylon = equalOperationToCeylon;
    codes = [aEqualsBExpression, aIntBEqualsAIntBIntCExpression];
}
