import ceylon.ast.core {
    ExponentiationOperation,
    PrePostfixingExpression,
    ExponentiatingExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    exponentiationOperationToCeylon,
    compileExponentiationOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPowerOp=PowerOp
    }
}

shared object exponentiationOperation satisfies ConcreteTest<ExponentiationOperation,JPowerOp> {
    
    String->ExponentiationOperation construct(String->PrePostfixingExpression left, String->ExponentiatingExpression right)
            => "``left.key``^``right.key``"->ExponentiationOperation(left.item, right.item);
    
    shared String->ExponentiationOperation _1138Pow1Operation = construct(integerLiteral._1138IntegerLiteral, integerLiteral.oneIntegerLiteral);
    
    compile = compileExponentiationOperation;
    fromCeylon = RedHatTransformer.transformExponentiationOperation;
    toCeylon = exponentiationOperationToCeylon;
    codes = [_1138Pow1Operation];
}
