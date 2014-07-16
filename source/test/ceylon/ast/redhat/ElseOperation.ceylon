import ceylon.ast.core {
    ElseOperation,
    Precedence15Expression,
    Precedence16Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    elseOperationToCeylon,
    compileElseOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDefaultOp=DefaultOp
    }
}

shared object elseOperation satisfies ConcreteTest<ElseOperation,JDefaultOp> {
    
    String->ElseOperation construct(String->Precedence16Expression left, String->Precedence15Expression right)
            => "``left.key`` else ``right.key``"->ElseOperation(left.item, right.item);
    
    shared String->ElseOperation parsedIntElse0LiteralExpression = construct(baseExpression.parsedIntExpression, integerLiteral._0IntegerLiteral);
    
    // not tested directly, but used by other tests
    shared String->ElseOperation nameElseWorldStringLiteralExpression = construct(baseExpression.nameExpression, stringLiteral.worldStringLiteral);
    
    compile = compileElseOperation;
    fromCeylon = RedHatTransformer.transformElseOperation;
    toCeylon = elseOperationToCeylon;
    codes = [parsedIntElse0LiteralExpression];
}
