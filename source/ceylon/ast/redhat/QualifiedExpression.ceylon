import ceylon.ast.core {
    LIdentifier,
    MemberNameWithTypeArguments,
    NameWithTypeArguments,
    Node,
    QualifiedExpression,
    TypeNameWithTypeArguments,
    UIdentifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JQualifiedMemberOrTypeExpression=QualifiedMemberOrTypeExpression
    }
}

"Converts a RedHat AST [[QualifiedMemberOrTypeExpression|JQualifiedMemberOrTypeExpression]]
 to a `ceylon.ast` [[QualifiedExpression]]."
shared QualifiedExpression qualifiedExpressionToCeylon(JQualifiedMemberOrTypeExpression qualifiedMemberOrTypeExpression, Anything(JNode,Node) update = noop) {
    value name = identifierToCeylon(qualifiedMemberOrTypeExpression.identifier, update);
    value ta = anyTypeArgumentsToCeylon(qualifiedMemberOrTypeExpression.typeArguments, update);
    NameWithTypeArguments nta;
    switch (name)
    case (is LIdentifier) { nta = MemberNameWithTypeArguments(name, ta); }
    case (is UIdentifier) { nta = TypeNameWithTypeArguments(name, ta); }
    update(qualifiedMemberOrTypeExpression, nta);
    value result = QualifiedExpression(primaryToCeylon(qualifiedMemberOrTypeExpression.primary, update), nta, anyMemberOperatorToCeylon(qualifiedMemberOrTypeExpression.memberOperator, update));
    update(qualifiedMemberOrTypeExpression, result);
    return result;
}

"Compiles the given [[code]] for a Qualified Expression
 into a [[QualifiedExpression]] using the Ceylon compiler
 (more specifically, the rule for a `primary`)."
shared QualifiedExpression? compileQualifiedExpression(String code, Anything(JNode,Node) update = noop) {
    value parser = createParser(code);
    if (is JQualifiedMemberOrTypeExpression jQualifiedMemberOrTypeExpression = parser.primary()) {
        return qualifiedExpressionToCeylon(jQualifiedMemberOrTypeExpression, update);
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
