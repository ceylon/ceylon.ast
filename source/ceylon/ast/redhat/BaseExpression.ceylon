import ceylon.ast.core {
    BaseExpression,
    LIdentifier,
    MemberNameWithTypeArguments,
    NameWithTypeArguments,
    Node,
    TypeNameWithTypeArguments,
    UIdentifier
}
import com.redhat.ceylon.compiler.typechecker.tree {
    JNode=Node,
    Tree {
        JBaseMemberOrTypeExpression=BaseMemberOrTypeExpression,
        JBaseMemberExpression=BaseMemberExpression,
        JBaseTypeExpression=BaseTypeExpression,
        JTypeArgumentList=TypeArgumentList,
        JInferredTypeArguments=InferredTypeArguments
    }
}

"Converts a RedHat AST [[BaseMemberOrTypeExpression|JBaseMemberOrTypeExpression]]
 to a `ceylon.ast` [[BaseExpression]]."
shared BaseExpression baseExpressionToCeylon(JBaseMemberOrTypeExpression baseMemberOrTypeExpression, Anything(JNode,Node) update = noop) {
    assert (is JTypeArgumentList|JInferredTypeArguments jTypeArguments = baseMemberOrTypeExpression.typeArguments);
    value name = identifierToCeylon(baseMemberOrTypeExpression.identifier, update);
    value ta = anyTypeArgumentsToCeylon(baseMemberOrTypeExpression.typeArguments, update);
    NameWithTypeArguments nta;
    switch (name)
    case (is LIdentifier) { nta = MemberNameWithTypeArguments(name, ta); }
    case (is UIdentifier) { nta = TypeNameWithTypeArguments(name, ta); }
    update(baseMemberOrTypeExpression, nta);
    value result = BaseExpression(nta);
    update(baseMemberOrTypeExpression, result);
    return result;
}

"Compiles the given [[code]] for a Base Expression
 into a [[BaseExpression]] using the Ceylon compiler
 (more specifically, the rule for a `baseReference`)."
shared BaseExpression? compileBaseExpression(String code, Anything(JNode,Node) update = noop) {
    if (exists jBaseReference = createParser(code).baseReference()) {
        JBaseMemberOrTypeExpression expr;
        if (jBaseReference.isMember) {
            expr = JBaseMemberExpression(null);
        } else {
            expr = JBaseTypeExpression(null);
        }
        expr.identifier = jBaseReference.identifier;
        expr.typeArguments = jBaseReference.typeArgumentList else JInferredTypeArguments(null);
        return baseExpressionToCeylon(expr, update);
    } else {
        return null;
    }
}
