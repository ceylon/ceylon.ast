import ceylon.ast.core {
    Precedence10Expression,
    SmallerOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    smallerOperationToCeylon,
    compileSmallerOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSmallerOp=SmallerOp
    }
}

shared object smallerOperation satisfies ConcreteTest<SmallerOperation,JSmallerOp> {
    
    String->SmallerOperation construct(String->Precedence10Expression left, String->Precedence10Expression right)
            => "``left.key``<``right.key``"->SmallerOperation(left.item, right.item);
    
    shared String->SmallerOperation _1138SmallerExpression = construct(integerLiteral._1138IntegerLiteral, integerLiteral.oneIntegerLiteral);
    
    compile = compileSmallerOperation;
    fromCeylon = RedHatTransformer.transformSmallerOperation;
    toCeylon = smallerOperationToCeylon;
    codes = [_1138SmallerExpression];
}
