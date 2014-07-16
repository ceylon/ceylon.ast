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
    shared String->QualifiedExpression nameEmptyExpression
            = "``baseExpression.nameExpression.key``.empty"->QualifiedExpression(
        baseExpression.nameExpression.item,
        MemberNameWithTypeArguments(LIdentifier("empty")));
    
    compile = compileQualifiedExpression;
    fromCeylon = RedHatTransformer.transformQualifiedExpression;
    toCeylon = qualifiedExpressionToCeylon;
    codes = [joinWithCommasQualifiedExpression, processArgumentsFirstQualifiedExpression];
}
