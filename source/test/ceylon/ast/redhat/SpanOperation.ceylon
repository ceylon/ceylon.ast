import ceylon.ast.core {
    AddingExpression,
    SpanOperation
}
import ceylon.ast.redhat {
    RedHatTransformer,
    spanOperationToCeylon,
    compileSpanOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JRangeOp=RangeOp
    }
}

shared object spanOperation satisfies ConcreteTest<SpanOperation,JRangeOp> {
    
    String->SpanOperation construct(String->AddingExpression left, String->AddingExpression right)
            => "``left.key``..``right.key``"->SpanOperation(left.item, right.item);
    
    shared String->SpanOperation _1SpanTo1138Expression = construct(integerLiteral.oneIntegerLiteral, integerLiteral._1138IntegerLiteral);
    
    compile = compileSpanOperation;
    fromCeylon = RedHatTransformer.transformSpanOperation;
    toCeylon = spanOperationToCeylon;
    codes = [_1SpanTo1138Expression];
}
