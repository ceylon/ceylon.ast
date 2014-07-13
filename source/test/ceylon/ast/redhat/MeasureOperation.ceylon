import ceylon.ast.core {
    MeasureOperation,
    Precedence8Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    measureOperationToCeylon,
    compileMeasureOperation
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JSegmentOp=SegmentOp
    }
}

shared object measureOperation satisfies ConcreteTest<MeasureOperation,JSegmentOp> {
    
    String->MeasureOperation construct(String->Precedence8Expression left, String->Precedence8Expression right)
            => "``left.key``:``right.key``"->MeasureOperation(left.item, right.item);
    
    shared String->MeasureOperation _1MeasureLength1138Expression = construct(integerLiteral.oneIntegerLiteral, integerLiteral._1138IntegerLiteral);
    
    compile = compileMeasureOperation;
    fromCeylon = RedHatTransformer.transformMeasureOperation;
    toCeylon = measureOperationToCeylon;
    codes = [_1MeasureLength1138Expression];
}
