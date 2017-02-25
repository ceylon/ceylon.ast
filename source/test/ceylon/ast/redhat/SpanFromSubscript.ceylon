import ceylon.ast.core {
    AddingExpression,
    SpanFromSubscript
}
import ceylon.ast.redhat {
    RedHatTransformer,
    spanFromSubscriptToCeylon,
    parseSpanFromSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

shared object spanFromSubscript satisfies ConcreteTest<SpanFromSubscript,JElementRange> {
    
    String->SpanFromSubscript construct(String->AddingExpression from)
            => "``from.key``..." -> SpanFromSubscript(from.item);
    
    shared String->SpanFromSubscript spanFrom2Subscript = construct(integerLiteral._2IntegerLiteral);
    
    parse = parseSpanFromSubscript;
    fromCeylon = RedHatTransformer.transformSpanFromSubscript;
    toCeylon = spanFromSubscriptToCeylon;
    codes = [spanFrom2Subscript];
}
