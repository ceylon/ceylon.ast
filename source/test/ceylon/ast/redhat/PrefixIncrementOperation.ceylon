import ceylon.ast.core {
    PrefixIncrementOperation,
    Primary
}
import ceylon.ast.redhat {
    RedHatTransformer,
    prefixIncrementOperationToCeylon,
    parsePrefixIncrementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIncrementOp=IncrementOp
    }
}

shared object prefixIncrementOperation satisfies ConcreteTest<PrefixIncrementOperation,JIncrementOp> {
    
    String->PrefixIncrementOperation construct(String->Primary operand)
            => "++``operand.key``"->PrefixIncrementOperation(operand.item);
    
    shared String->PrefixIncrementOperation _1138IntegerLiteralPrefixIncrementOperation = construct(integerLiteral._1138IntegerLiteral);
    shared String->PrefixIncrementOperation oneIntegerLiteralGroupedExpressionPrefixIncrementOperation = construct(groupedExpression.oneIntegerLiteralGroupedExpression);
    
    parse = parsePrefixIncrementOperation;
    fromCeylon = RedHatTransformer.transformPrefixIncrementOperation;
    toCeylon = prefixIncrementOperationToCeylon;
    codes = [_1138IntegerLiteralPrefixIncrementOperation, oneIntegerLiteralGroupedExpressionPrefixIncrementOperation];
}
