import ceylon.ast.core {
    PrefixDecrementOperation,
    Primary
}
import ceylon.ast.redhat {
    RedHatTransformer,
    prefixDecrementOperationToCeylon,
    compilePrefixDecrementOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JDecrementOp=DecrementOp
    }
}

shared object prefixDecrementOperation satisfies ConcreteTest<PrefixDecrementOperation,JDecrementOp> {
    
    String->PrefixDecrementOperation construct(String->Primary child)
            => "--``child.key``"->PrefixDecrementOperation(child.item);
    
    shared String->PrefixDecrementOperation _1138IntegerLiteralPrefixDecrementOperation = construct(integerLiteral._1130IntegerLiteral);
    shared String->PrefixDecrementOperation _1138IntegerLiteralGroupedExpressionPrefixDecrementOperation = construct(groupedExpression.oneIntegerLiteralGroupedExpression);
    
    compile = compilePrefixDecrementOperation;
    fromCeylon = RedHatTransformer.transformPrefixDecrementOperation;
    toCeylon = prefixDecrementOperationToCeylon;
    codes = [_1138IntegerLiteralPrefixDecrementOperation, _1138IntegerLiteralGroupedExpressionPrefixDecrementOperation];
}
