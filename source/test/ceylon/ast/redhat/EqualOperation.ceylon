import ceylon.ast.core {
    EqualOperation,
    Precedence11Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    equalOperationToCeylon,
    compileEqualOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JEqualOp=EqualOp
    }
}

shared object equalOperation satisfies ConcreteTest<EqualOperation,JEqualOp> {
    
    String->EqualOperation construct(String->Precedence11Expression left, String->Precedence11Expression right)
            => "``left.key``==``right.key``"->EqualOperation(left.item, right.item);
    
    shared String->EqualOperation aEqualsBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    "a&b == a&b&c"
    shared String->EqualOperation aIntBEqualsAIntBIntCExpression = construct(intersectionOperation.aIntersectBExpression, intersectionOperation.aIntersectBIntersectCExpression);
    
    compile = compileEqualOperation;
    fromCeylon = RedHatTransformer.transformEqualOperation;
    toCeylon = equalOperationToCeylon;
    codes = [aEqualsBExpression, aIntBEqualsAIntBIntCExpression];
}
