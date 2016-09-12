import ceylon.ast.core {
    AddingExpression,
    SpanToSubscript
}
import ceylon.ast.redhat {
    RedHatTransformer,
    spanToSubscriptToCeylon,
    parseSpanToSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

shared object spanToSubscript satisfies ConcreteTest<SpanToSubscript,JElementRange> {
    
    String->SpanToSubscript construct(String->AddingExpression to)
            => "...``to.key``"->SpanToSubscript(to.item);
    
    shared String->SpanToSubscript spanToCountSubscript = construct(baseExpression.countExpression);
    
    parse = parseSpanToSubscript;
    fromCeylon = RedHatTransformer.transformSpanToSubscript;
    toCeylon = spanToSubscriptToCeylon;
    codes = [spanToCountSubscript];
}
