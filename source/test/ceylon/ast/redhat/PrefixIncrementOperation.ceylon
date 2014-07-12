import ceylon.ast.core {
    PrefixIncrementOperation,
    Primary
}
import ceylon.ast.redhat {
    RedHatTransformer,
    prefixIncrementOperationToCeylon,
    compilePrefixIncrementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIncrementOp=IncrementOp
    }
}

shared object prefixIncrementOperation satisfies ConcreteTest<PrefixIncrementOperation,JIncrementOp> {
    
    String->PrefixIncrementOperation construct(String->Primary child)
            => "++``child.key``"->PrefixIncrementOperation(child.item);
    
    shared String->PrefixIncrementOperation oneOneThreeEightIntegerLiteralPrefixIncrementOperation = construct(integerLiteral._1130IntegerLiteral);
    shared String->PrefixIncrementOperation oneIntegerLiteralGroupedExpressionPrefixIncrementOperation = construct(groupedExpression.oneIntegerLiteralGroupedExpression);
    
    compile = compilePrefixIncrementOperation;
    fromCeylon = RedHatTransformer.transformPrefixIncrementOperation;
    toCeylon = prefixIncrementOperationToCeylon;
    codes = [oneOneThreeEightIntegerLiteralPrefixIncrementOperation, oneIntegerLiteralGroupedExpressionPrefixIncrementOperation];
}
