import ceylon.ast.core {
    MeasureSubscript,
    Precedence8Expression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    measureSubscriptToCeylon,
    compileMeasureSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

shared object measureSubscript satisfies ConcreteTest<MeasureSubscript,JElementRange> {
    
    String->MeasureSubscript construct(String->Precedence8Expression from, String->Precedence8Expression length)
            => "``from.key``:``length.key``"->MeasureSubscript(from.item, length.item);
    
    shared String->MeasureSubscript iMeasureLength2Subscript = construct(baseExpression.iExpression, integerLiteral._2IntegerLiteral);
    
    compile = compileMeasureSubscript;
    fromCeylon = RedHatTransformer.transformMeasureSubscript;
    toCeylon = measureSubscriptToCeylon;
    codes = [iMeasureLength2Subscript];
}
