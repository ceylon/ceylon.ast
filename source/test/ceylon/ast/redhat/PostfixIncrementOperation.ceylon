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
    
    String->PostfixIncrementOperation construct(String->Primary child)
            => "``child.key``++"->PostfixIncrementOperation(child.item);
    
    shared String->PostfixIncrementOperation oneOneThreeEightIntegerLiteralPostfixIncrementOperation = construct(integerLiteral.oneOneThreeEightIntegerLiteral);
    shared String->PostfixIncrementOperation oneIntegerLiteralGroupedExpressionPostfixIncrementOperation = construct(groupedExpression.oneIntegerLiteralGroupedExpression);
    
    compile = compilePostfixIncrementOperation;
    fromCeylon = RedHatTransformer.transformPostfixIncrementOperation;
    toCeylon = postfixIncrementOperationToCeylon;
    codes = [oneOneThreeEightIntegerLiteralPostfixIncrementOperation, oneIntegerLiteralGroupedExpressionPostfixIncrementOperation];
}
