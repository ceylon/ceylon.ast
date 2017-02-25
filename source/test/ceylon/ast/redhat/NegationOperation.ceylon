import ceylon.ast.core {
    NegationOperation,
    ExponentiatingExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    negationOperationToCeylon,
    parseNegationOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JNegativeOp=NegativeOp
    }
}

shared object negationOperation satisfies ConcreteTest<NegationOperation,JNegativeOp> {
    
    String->NegationOperation construct(String->ExponentiatingExpression operand)
            => "-``operand.key``" -> NegationOperation(operand.item);
    
    shared String->NegationOperation minus1138Expression = construct(integerLiteral._1138IntegerLiteral);
    shared String->NegationOperation minusPowExpression = construct(exponentiationOperation._1138Pow1Operation);
    
    // not tested directly, but used by other tests
    shared String->NegationOperation minusOneExpression = construct(integerLiteral.oneIntegerLiteral);
    
    parse = parseNegationOperation;
    fromCeylon = RedHatTransformer.transformNegationOperation;
    toCeylon = negationOperationToCeylon;
    codes = [minus1138Expression, minusPowExpression];
}
