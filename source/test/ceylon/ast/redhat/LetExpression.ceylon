import ceylon.ast.core {
    Expression,
    LetExpression,
    LIdentifier,
    PatternList,
    SpecifiedPattern,
    UnspecifiedVariable,
    VariablePattern
}
import ceylon.ast.redhat {
    RedHatTransformer,
    letExpressionToCeylon,
    compileLetExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JLetExpression=LetExpression
    }
}

shared object letExpression satisfies ConcreteTest<LetExpression,JLetExpression> {
    
    String->LetExpression construct([<String->SpecifiedPattern>+] patterns, String->Expression expression)
            => "let (``",".join(patterns*.key)``) ``expression.key``"->LetExpression(PatternList(patterns*.item), expression.item);
    
    shared String->LetExpression distLetExpression = construct(["dist=1"->SpecifiedPattern(VariablePattern(UnspecifiedVariable(LIdentifier("dist"))), specifier.oneSpecifier.item)], baseExpression.iExpression);
    shared String->LetExpression abcLetExpression = construct([
            "a=1"->SpecifiedPattern(VariablePattern(UnspecifiedVariable(LIdentifier("a"))), specifier.oneSpecifier.item),
            "b=0"->SpecifiedPattern(VariablePattern(UnspecifiedVariable(LIdentifier("b"))), specifier._0Specifier.item),
            "c=1"->SpecifiedPattern(VariablePattern(UnspecifiedVariable(LIdentifier("c"))), specifier.oneSpecifier.item)],
        sumOperation.aTimesBPlusCExpression);
    
    compile = compileLetExpression;
    fromCeylon = RedHatTransformer.transformLetExpression;
    toCeylon = letExpressionToCeylon;
    codes = [distLetExpression, abcLetExpression];
}
