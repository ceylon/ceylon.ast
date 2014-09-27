import ceylon.ast.core {
    ProductOperation,
    UnioningExpression,
    MultiplyingExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    productOperationToCeylon,
    compileProductOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JProductOp=ProductOp
    }
}

shared object productOperation satisfies ConcreteTest<ProductOperation,JProductOp> {
    
    String->ProductOperation construct(String->MultiplyingExpression left, String->UnioningExpression right)
            => "``left.key``*``right.key``"->ProductOperation(left.item, right.item);
    
    shared String->ProductOperation aTimesBExpression = construct(baseExpression.aExpression, baseExpression.bExpression);
    shared String->ProductOperation intTimesFloatExpression = construct(integerLiteral._1138IntegerLiteral, floatLiteral.oPointOFortyTwoKFloatLiteral);
    
    compile = compileProductOperation;
    fromCeylon = RedHatTransformer.transformProductOperation;
    toCeylon = productOperationToCeylon;
    codes = [aTimesBExpression, intTimesFloatExpression];
}
