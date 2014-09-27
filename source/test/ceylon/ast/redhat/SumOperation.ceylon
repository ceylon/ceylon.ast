import ceylon.ast.core {
    ScalingExpression,
    AddingExpression,
    SumOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    sumOperationToCeylon,
    compileSumOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSumOp=SumOp
    }
}

shared object sumOperation satisfies ConcreteTest<SumOperation,JSumOp> {
    
    String->SumOperation construct(String->AddingExpression left, String->ScalingExpression right) => "``left.key``+``right.key``"->SumOperation(left.item, right.item);
    
    shared String->SumOperation onePlusOneExpression = construct(integerLiteral.oneIntegerLiteral, integerLiteral.oneIntegerLiteral);
    shared String->SumOperation aTimesBPlusCExpression = construct(productOperation.aTimesBExpression, baseExpression.cExpression);
    
    // not tested directly, but used by other tests
    shared String->SumOperation helloPlusNameElseWorldExpression = construct(stringLiteral.helloStringLiteral, groupedExpression.nameElseWorldStringLiteralGroupedExpression);
    """`"Hello, " + (name else "World") + "!"`"""
    shared String->SumOperation helloPlusNameElseWorldPlusBangExpression = construct(helloPlusNameElseWorldExpression, stringLiteral.bangStringLiteral);
    shared String->SumOperation onePlusInterestRateExpression = construct(integerLiteral.oneIntegerLiteral, baseExpression.interestRateExpression);
    
    compile = compileSumOperation;
    fromCeylon = RedHatTransformer.transformSumOperation;
    toCeylon = sumOperationToCeylon;
    codes = [onePlusOneExpression, aTimesBPlusCExpression];
}
