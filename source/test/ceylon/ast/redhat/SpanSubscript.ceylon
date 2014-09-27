import ceylon.ast.core {
    AddingExpression,
    SpanSubscript
}
import ceylon.ast.redhat {
    RedHatTransformer,
    spanSubscriptToCeylon,
    compileSpanSubscript
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JElementRange=ElementRange
    }
}

shared object spanSubscript satisfies ConcreteTest<SpanSubscript,JElementRange> {
    
    String->SpanSubscript construct(String->AddingExpression first, String->AddingExpression last)
            => "``first.key``..``last.key``"->SpanSubscript(first.item, last.item);
    
    shared String->SpanSubscript spanOneToParsedIntSubscript = construct(integerLiteral.oneIntegerLiteral, baseExpression.parsedIntExpression);
    
    compile = compileSpanSubscript;
    fromCeylon = RedHatTransformer.transformSpanSubscript;
    toCeylon = spanSubscriptToCeylon;
    codes = [spanOneToParsedIntSubscript];
}
