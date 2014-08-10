import ceylon.ast.core {
    PrefixPostfixStatement,
    PrefixOperation,
    PostfixOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    prefixPostfixStatementToCeylon,
    compilePrefixPostfixStatement
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JExpressionStatement=ExpressionStatement
    }
}

shared object prefixPostfixStatement satisfies ConcreteTest<PrefixPostfixStatement,JExpressionStatement> {
    
    String->PrefixPostfixStatement construct(String->PrefixOperation|PostfixOperation expression)
            => "``expression.key``;"->PrefixPostfixStatement(expression.item);
    
    shared String->PrefixPostfixStatement _1138PostfixIncrementStatement = construct(postfixIncrementOperation._1138IntegerLiteralPostfixIncrementOperation);
    shared String->PrefixPostfixStatement _1138PrefixDecrementStatement = construct(prefixDecrementOperation._1138IntegerLiteralPrefixDecrementOperation);
    
    compile = compilePrefixPostfixStatement;
    fromCeylon = RedHatTransformer.transformPrefixPostfixStatement;
    toCeylon = prefixPostfixStatementToCeylon;
    codes = [_1138PostfixIncrementStatement, _1138PrefixDecrementStatement];
}
