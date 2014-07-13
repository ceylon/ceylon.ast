import ceylon.ast.core {
    Precedence7Expression,
    Precedence8Expression,
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
    
    String->SumOperation construct(String->Precedence8Expression left, String->Precedence7Expression right)
            => "``left.key``+``right.key``"->SumOperation(left.item, right.item);
    
    shared String->SumOperation onePlusOneExpression = construct(integerLiteral.oneIntegerLiteral, integerLiteral.oneIntegerLiteral);
    shared String->SumOperation aTimesBPlusCExpression = construct(productOperation.aTimesBExpression, baseExpression.cExpression);
    
    compile = compileSumOperation;
    fromCeylon = RedHatTransformer.transformSumOperation;
    toCeylon = sumOperationToCeylon;
    codes = [onePlusOneExpression, aTimesBPlusCExpression];
}
