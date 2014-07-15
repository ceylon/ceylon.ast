import ceylon.ast.core {
    PostfixIncrementOperation,
    Primary
}
import ceylon.ast.redhat {
    RedHatTransformer,
    postfixIncrementOperationToCeylon,
    compilePostfixIncrementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPostfixIncrementOp=PostfixIncrementOp
    }
}

shared object postfixIncrementOperation satisfies ConcreteTest<PostfixIncrementOperation,JPostfixIncrementOp> {
    
    String->PostfixIncrementOperation construct(String->Primary operand)
            => "``operand.key``++"->PostfixIncrementOperation(operand.item);
    
    shared String->PostfixIncrementOperation _1138IntegerLiteralPostfixIncrementOperation = construct(integerLiteral._1138IntegerLiteral);
    shared String->PostfixIncrementOperation _1138IntegerLiteralGroupedExpressionPostfixIncrementOperation = construct(groupedExpression.oneIntegerLiteralGroupedExpression);
    
    compile = compilePostfixIncrementOperation;
    fromCeylon = RedHatTransformer.transformPostfixIncrementOperation;
    toCeylon = postfixIncrementOperationToCeylon;
    codes = [_1138IntegerLiteralPostfixIncrementOperation, _1138IntegerLiteralGroupedExpressionPostfixIncrementOperation];
}
