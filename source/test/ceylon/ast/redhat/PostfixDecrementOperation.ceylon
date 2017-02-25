import ceylon.ast.core {
    PostfixDecrementOperation,
    Primary
}
import ceylon.ast.redhat {
    RedHatTransformer,
    postfixDecrementOperationToCeylon,
    parsePostfixDecrementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPostfixDecrementOp=PostfixDecrementOp
    }
}

shared object postfixDecrementOperation satisfies ConcreteTest<PostfixDecrementOperation,JPostfixDecrementOp> {
    
    String->PostfixDecrementOperation construct(String->Primary operand)
            => "``operand.key``--" -> PostfixDecrementOperation(operand.item);
    
    shared String->PostfixDecrementOperation _1138IntegerLiteralPostfixDecrementOperation = construct(integerLiteral._1138IntegerLiteral);
    shared String->PostfixDecrementOperation _1138IntegerLiteralGroupedExpressionPostfixDecrementOperation = construct(groupedExpression.oneIntegerLiteralGroupedExpression);
    
    parse = parsePostfixDecrementOperation;
    fromCeylon = RedHatTransformer.transformPostfixDecrementOperation;
    toCeylon = postfixDecrementOperationToCeylon;
    codes = [_1138IntegerLiteralPostfixDecrementOperation, _1138IntegerLiteralGroupedExpressionPostfixDecrementOperation];
}
