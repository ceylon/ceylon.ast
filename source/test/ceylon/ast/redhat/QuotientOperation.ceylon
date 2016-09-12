import ceylon.ast.core {
    UnioningExpression,
    MultiplyingExpression,
    QuotientOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    quotientOperationToCeylon,
    parseQuotientOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JQuotientOp=QuotientOp
    }
}

shared object quotientOperation satisfies ConcreteTest<QuotientOperation,JQuotientOp> {
    
    String->QuotientOperation construct(String->MultiplyingExpression left, String->UnioningExpression right)
            => "``left.key``/``right.key``"->QuotientOperation(left.item, right.item);
    
    shared String->QuotientOperation minus1138Divide1138Expression = construct(negationOperation.minus1138Expression, integerLiteral._1138IntegerLiteral);
    
    parse = parseQuotientOperation;
    fromCeylon = RedHatTransformer.transformQuotientOperation;
    toCeylon = quotientOperationToCeylon;
    codes = [minus1138Divide1138Expression];
}
