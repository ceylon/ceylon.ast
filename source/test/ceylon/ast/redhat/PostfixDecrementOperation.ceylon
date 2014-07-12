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
    
    shared String->PostfixDecrementOperation _1138IntegerLiteralPostfixDecrementOperation = construct(integerLiteral._1130IntegerLiteral);
    shared String->PostfixDecrementOperation _1138IntegerLiteralGroupedExpressionPostfixDecrementOperation = construct(groupedExpression.oneIntegerLiteralGroupedExpression);
    
    compile = compilePostfixDecrementOperation;
    fromCeylon = RedHatTransformer.transformPostfixDecrementOperation;
    toCeylon = postfixDecrementOperationToCeylon;
    codes = [_1138IntegerLiteralPostfixDecrementOperation, _1138IntegerLiteralGroupedExpressionPostfixDecrementOperation];
}
