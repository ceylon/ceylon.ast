import ceylon.ast.core {
    MeasureSubscript,
    AddingExpression
}
import ceylon.ast.redhat {
    RedHatTransformer,
    measureSubscriptToCeylon,
    parseMeasureSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

shared object measureSubscript satisfies ConcreteTest<MeasureSubscript,JElementRange> {
    
    String->MeasureSubscript construct(String->AddingExpression from, String->AddingExpression length)
            => "``from.key``:``length.key``"->MeasureSubscript(from.item, length.item);
    
    shared String->MeasureSubscript iMeasureLength2Subscript = construct(baseExpression.iExpression, integerLiteral._2IntegerLiteral);
    
    parse = parseMeasureSubscript;
    fromCeylon = RedHatTransformer.transformMeasureSubscript;
    toCeylon = measureSubscriptToCeylon;
    codes = [iMeasureLength2Subscript];
}
