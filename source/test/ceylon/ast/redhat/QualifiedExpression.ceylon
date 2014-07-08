import ceylon.ast.core {
    LIdentifier,
    MemberNameWithTypeArguments,
    QualifiedExpression,
    StringLiteral
}
import ceylon.ast.redhat {
    RedHatTransformer,
    qualifiedExpressionToCeylon,
    compileQualifiedExpression
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JQualifiedMemberOrTypeExpression=QualifiedMemberOrTypeExpression
    }
}

shared object qualifiedExpression satisfies ConcreteTest<QualifiedExpression,JQualifiedMemberOrTypeExpression> {
    shared String->QualifiedExpression joinWithCommasQualifiedExpression = """", ".join"""->QualifiedExpression(StringLiteral(""", """), MemberNameWithTypeArguments(LIdentifier("join")));
    shared String->QualifiedExpression processArgumentsQualifiedExpression
            = "``baseExpression.processExpression.key``.arguments"->QualifiedExpression(
        baseExpression.processExpression.item,
        MemberNameWithTypeArguments(LIdentifier("arguments")));
    shared String->QualifiedExpression processArgumentsFirstQualifiedExpression
            = "``processArgumentsQualifiedExpression.key``.first"->QualifiedExpression(
        processArgumentsQualifiedExpression.item,
        MemberNameWithTypeArguments(LIdentifier("first")));
    
    shared actual QualifiedExpression? compile(String code) => compileQualifiedExpression(code);
    shared actual JQualifiedMemberOrTypeExpression fromCeylon(RedHatTransformer transformer)(QualifiedExpression node) => transformer.transformQualifiedExpression(node);
    shared actual QualifiedExpression toCeylon(JQualifiedMemberOrTypeExpression node) => qualifiedExpressionToCeylon(node);
    codes = [joinWithCommasQualifiedExpression, processArgumentsFirstQualifiedExpression];
}
