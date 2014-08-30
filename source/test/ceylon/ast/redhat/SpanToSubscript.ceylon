import ceylon.ast.core {
    Precedence8Expression,
    SpanToSubscript
}
import ceylon.ast.redhat {
    RedHatTransformer,
    spanToSubscriptToCeylon,
    compileSpanToSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

shared object spanToSubscript satisfies ConcreteTest<SpanToSubscript,JElementRange> {
    
    String->SpanToSubscript construct(String->Precedence8Expression to)
            => "...``to.key``"->SpanToSubscript(to.item);
    
    shared String->SpanToSubscript spanToCountSubscript = construct(baseExpression.countExpression);
    
    compile = compileSpanToSubscript;
    fromCeylon = RedHatTransformer.transformSpanToSubscript;
    toCeylon = spanToSubscriptToCeylon;
    codes = [spanToCountSubscript];
}
