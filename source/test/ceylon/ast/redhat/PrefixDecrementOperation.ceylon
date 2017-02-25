import ceylon.ast.core {
    PrefixDecrementOperation,
    Primary
}
import ceylon.ast.redhat {
    RedHatTransformer,
    prefixDecrementOperationToCeylon,
    parsePrefixDecrementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDecrementOp=DecrementOp
    }
}

shared object prefixDecrementOperation satisfies ConcreteTest<PrefixDecrementOperation,JDecrementOp> {
    
    String->PrefixDecrementOperation construct(String->Primary operand)
            => "--``operand.key``" -> PrefixDecrementOperation(operand.item);
    
    shared String->PrefixDecrementOperation _1138IntegerLiteralPrefixDecrementOperation = construct(integerLiteral._1138IntegerLiteral);
    shared String->PrefixDecrementOperation _1138IntegerLiteralGroupedExpressionPrefixDecrementOperation = construct(groupedExpression.oneIntegerLiteralGroupedExpression);
    
    parse = parsePrefixDecrementOperation;
    fromCeylon = RedHatTransformer.transformPrefixDecrementOperation;
    toCeylon = prefixDecrementOperationToCeylon;
    codes = [_1138IntegerLiteralPrefixDecrementOperation, _1138IntegerLiteralGroupedExpressionPrefixDecrementOperation];
}
