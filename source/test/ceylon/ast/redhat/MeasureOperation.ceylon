import ceylon.ast.core {
    MeasureOperation,
    AddingExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    measureOperationToCeylon,
    parseMeasureOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSegmentOp=SegmentOp
    }
}

shared object measureOperation satisfies ConcreteTest<MeasureOperation,JSegmentOp> {
    
    String->MeasureOperation construct(String->AddingExpression left, String->AddingExpression right)
            => "``left.key``:``right.key``" -> MeasureOperation(left.item, right.item);
    
    shared String->MeasureOperation _1MeasureLength1138Expression = construct(integerLiteral.oneIntegerLiteral, integerLiteral._1138IntegerLiteral);
    
    parse = parseMeasureOperation;
    fromCeylon = RedHatTransformer.transformMeasureOperation;
    toCeylon = measureOperationToCeylon;
    codes = [_1MeasureLength1138Expression];
}
