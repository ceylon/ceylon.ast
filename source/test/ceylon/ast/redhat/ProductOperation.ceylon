import ceylon.ast.core {
    ProductOperation,
    UnioningExpression,
    MultiplyingExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    productOperationToCeylon,
    parseProductOperation
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
    
    // not tested directly, but used in other tests
    shared String->ProductOperation rTimesCosExpression => construct(baseExpression.rExpression, invocation.cosPhiInvocation);
    shared String->ProductOperation rTimesSinExpression => construct(baseExpression.rExpression, invocation.sinPhiInvocation);
    
    parse = parseProductOperation;
    fromCeylon = RedHatTransformer.transformProductOperation;
    toCeylon = productOperationToCeylon;
    codes = [aTimesBExpression, intTimesFloatExpression];
}
