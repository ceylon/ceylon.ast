import ceylon.ast.core {
    AssignOperation,
    Expression,
    ThenElseExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    assignOperationToCeylon,
    parseAssignOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JAssignOp=AssignOp
    }
}

shared object assignOperation satisfies ConcreteTest<AssignOperation,JAssignOp> {
    
    String->AssignOperation construct(String->ThenElseExpression left, String->Expression right)
            => "``left.key``=``right.key``"->AssignOperation(left.item, right.item);
    
    shared String->AssignOperation iAssign1Expression = construct(baseExpression.iExpression, integerLiteral.oneIntegerLiteral);
    shared String->AssignOperation textAssignExpression = construct(baseExpression.textExpression, sumOperation.helloPlusNameElseWorldPlusBangExpression);
    shared String->AssignOperation functionAssignExpression => construct(baseExpression.aExpression, functionExpression.emptyNoopFunctionExpression);
    
    // not tested directly, but used by other tests
    shared String->AssignOperation nameEmptyAssignTrueExpression = construct(qualifiedExpression.nameEmptyExpression, baseExpression.trueExpression);
    
    parse = parseAssignOperation;
    fromCeylon = RedHatTransformer.transformAssignOperation;
    toCeylon = assignOperationToCeylon;
    codes => [iAssign1Expression, textAssignExpression, functionAssignExpression];
}
