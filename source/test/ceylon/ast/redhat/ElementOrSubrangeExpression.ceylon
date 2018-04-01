import ceylon.ast.core {
    ElementOrSubrangeExpression,
    Primary,
    Subscript
}
import ceylon.ast.redhat {
    RedHatTransformer,
    elementOrSubrangeExpressionToCeylon,
    parseElementOrSubrangeExpression
}
import org.eclipse.ceylon.compiler.typechecker.tree {
    Tree {
        JIndexExpression=IndexExpression
    }
}

shared object elementOrSubrangeExpression satisfies ConcreteTest<ElementOrSubrangeExpression,JIndexExpression> {
    
    String->ElementOrSubrangeExpression construct(String->Primary primary, String->Subscript subscript)
            => "``primary.key``[``subscript.key``]" -> ElementOrSubrangeExpression(primary.item, subscript.item);
    
    shared String->ElementOrSubrangeExpression textElementIExpression = construct(baseExpression.textExpression, keySubscript.iKeySubscript);
    shared String->ElementOrSubrangeExpression processArgumentsFirstSpanFrom2Expression = construct(qualifiedExpression.processArgumentsFirstExpression, spanFromSubscript.spanFrom2Subscript);
    shared String->ElementOrSubrangeExpression emptyXElseOneExpression = construct(baseExpression.emptyExpression, keySubscript.xElseOneSubscript);
    
    parse = parseElementOrSubrangeExpression;
    fromCeylon = RedHatTransformer.transformElementOrSubrangeExpression;
    toCeylon = elementOrSubrangeExpressionToCeylon;
    codes = [textElementIExpression, processArgumentsFirstSpanFrom2Expression, emptyXElseOneExpression];
}
