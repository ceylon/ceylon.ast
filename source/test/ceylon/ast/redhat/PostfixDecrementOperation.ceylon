import ceylon.ast.core {
    PostfixDecrementOperation,
    Primary
}
import ceylon.ast.redhat {
    RedHatTransformer,
    postfixDecrementOperationToCeylon,
    compilePostfixDecrementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JPostfixDecrementOp=PostfixDecrementOp
    }
}

shared object postfixDecrementOperation satisfies ConcreteTest<PostfixDecrementOperation,JPostfixDecrementOp> {
    
    String->PostfixDecrementOperation construct(String->Primary child)
            => "``child.key``--"->PostfixDecrementOperation(child.item);
    
    shared String->PostfixDecrementOperation oneOneThreeEightIntegerLiteralPostfixDecrementOperation = construct(integerLiteral.oneOneThreeEightIntegerLiteral);
    shared String->PostfixDecrementOperation oneIntegerLiteralGroupedExpressionPostfixDecrementOperation = construct(groupedExpression.oneIntegerLiteralGroupedExpression);
    
    compile = compilePostfixDecrementOperation;
    fromCeylon = RedHatTransformer.transformPostfixDecrementOperation;
    toCeylon = postfixDecrementOperationToCeylon;
    codes = [oneOneThreeEightIntegerLiteralPostfixDecrementOperation, oneIntegerLiteralGroupedExpressionPostfixDecrementOperation];
}
