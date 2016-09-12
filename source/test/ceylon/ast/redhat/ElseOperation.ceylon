import ceylon.ast.core {
    ElseOperation,
    DisjoiningExpression,
    ThenElseExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    elseOperationToCeylon,
    parseElseOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDefaultOp=DefaultOp
    }
}

shared object elseOperation satisfies ConcreteTest<ElseOperation,JDefaultOp> {
    
    String->ElseOperation construct(String->ThenElseExpression left, String->DisjoiningExpression right)
            => "``left.key`` else ``right.key``"->ElseOperation(left.item, right.item);
    
    shared String->ElseOperation parsedIntElse0LiteralExpression = construct(baseExpression.parsedIntExpression, integerLiteral._0IntegerLiteral);
    
    // not tested directly, but used by other tests
    shared String->ElseOperation nameElseWorldStringLiteralExpression = construct(baseExpression.nameExpression, stringLiteral.worldStringLiteral);
    shared String->ElseOperation xElseOneOperation = construct(baseExpression.xExpression, integerLiteral.oneIntegerLiteral);
    
    parse = parseElseOperation;
    fromCeylon = RedHatTransformer.transformElseOperation;
    toCeylon = elseOperationToCeylon;
    codes = [parsedIntElse0LiteralExpression];
}
