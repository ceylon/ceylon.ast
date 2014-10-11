import ceylon.ast.core {
    LIdentifier,
    MemberNameWithTypeArguments,
    NameWithTypeArguments,
    QualifiedExpression,
    TypeNameWithTypeArguments,
    UIdentifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    Tree {
        JQualifiedMemberOrTypeExpression=QualifiedMemberOrTypeExpression
    }
}

"Converts a RedHat AST [[QualifiedMemberOrTypeExpression|JQualifiedMemberOrTypeExpression]]
 to a `ceylon.ast` [[QualifiedExpression]]."
shared QualifiedExpression qualifiedExpressionToCeylon(JQualifiedMemberOrTypeExpression qualifiedMemberOrTypeExpression) {
    value name = identifierToCeylon(qualifiedMemberOrTypeExpression.identifier);
    value ta = anyTypeArgumentsToCeylon(qualifiedMemberOrTypeExpression.typeArguments);
    NameWithTypeArguments nta;
    switch (name)
    case (is LIdentifier) { nta = MemberNameWithTypeArguments(name, ta); }
    case (is UIdentifier) { nta = TypeNameWithTypeArguments(name, ta); }
    return QualifiedExpression(primaryToCeylon(qualifiedMemberOrTypeExpression.primary), nta, anyMemberOperatorToCeylon(qualifiedMemberOrTypeExpression.memberOperator));
}

"Compiles the given [[code]] for a Qualified Expression
 into a [[QualifiedExpression]] using the Ceylon compiler
 (more specifically, the rule for a `primary`)."
shared QualifiedExpression? compileQualifiedExpression(String code) {
    value parser = createParser(code);
    if (is JQualifiedMemberOrTypeExpression jQualifiedMemberOrTypeExpression = parser.primary()) {
        return qualifiedExpressionToCeylon(jQualifiedMemberOrTypeExpression);
    } else {
        return null;
    }
    /*
     WARNING:
     I first implemented this using the grammar rules `base` and `qualifiedReference`,
     constructing the qualified expression from them myself.
     This _failed_ for the code "process.arguments.first", because the `base` was then only
     "process", not "process.arguments".
     I’m not sure why `base` isn’t greedy and `primary` is, but anyways… don’t try to “optimize” it
     like I wanted to.
     */
}
