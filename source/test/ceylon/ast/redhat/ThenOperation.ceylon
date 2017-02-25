import ceylon.ast.core {
    DisjoiningExpression,
    ThenElseExpression,
    ThenOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    thenOperationToCeylon,
    parseThenOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JThenOp=ThenOp
    }
}

shared object thenOperation satisfies ConcreteTest<ThenOperation,JThenOp> {
    
    String->ThenOperation construct(String->ThenElseExpression left, String->DisjoiningExpression right)
            => "``left.key`` then ``right.key``" -> ThenOperation(left.item, right.item);
    
    shared String->ThenOperation notNameEmptyThenNameExpression = construct(notOperation.notNameEmptyExpression, baseExpression.nameExpression);
    
    parse = parseThenOperation;
    fromCeylon = RedHatTransformer.transformThenOperation;
    toCeylon = thenOperationToCeylon;
    codes = [notNameEmptyThenNameExpression];
}
