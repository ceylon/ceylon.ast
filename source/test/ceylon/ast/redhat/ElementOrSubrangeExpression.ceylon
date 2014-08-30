import ceylon.ast.core {
    ElementOrSubrangeExpression,
    Primary,
    Subscript
}
import ceylon.ast.redhat {
    RedHatTransformer,
    elementOrSubrangeExpressionToCeylon,
    compileElementOrSubrangeExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JIndexExpression=IndexExpression
    }
}

shared object elementOrSubrangeExpression satisfies ConcreteTest<ElementOrSubrangeExpression,JIndexExpression> {
    
    String->ElementOrSubrangeExpression construct(String->Primary primary, String->Subscript subscript)
            => "``primary.key``[``subscript.key``]"->ElementOrSubrangeExpression(primary.item, subscript.item);
    
    shared String->ElementOrSubrangeExpression textElementIExpression = construct(baseExpression.textExpression, keySubscript.iKeySubscript);
    shared String->ElementOrSubrangeExpression processArgumentsFirstSpanFrom2Expression = construct(qualifiedExpression.processArgumentsFirstQualifiedExpression, spanFromSubscript.spanFrom2Subscript);
    
    compile = compileElementOrSubrangeExpression;
    fromCeylon = RedHatTransformer.transformElementOrSubrangeExpression;
    toCeylon = elementOrSubrangeExpressionToCeylon;
    codes = [textElementIExpression, processArgumentsFirstSpanFrom2Expression];
}
